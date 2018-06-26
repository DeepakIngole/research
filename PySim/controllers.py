import numpy as np
import tiremodel_lib as tm
import vehicle_lib
import path_lib
import math



#Controller from Nitin Kapania's PhD thesis - lookahead with augmented sideslip for
#steering feedback, longitudinal is simple PID feedback control
class LaneKeepingController():
	def __init__(self, path, vehicle, profile):
		self.path = path
		self.vehicle = vehicle
		self.profile = profile
		self.xLA = 14.2    #lookahead distance, meters
		self.kLK = 0.0538  #proportional gain , rad / meter
		self.kSpeed = 1000.0 #Speed proportional gain - N / (m/s)
		self.alphaFlim = 7.0 * np.pi / 180 #steering limits for feedforward controller
		self.alphaRlim = 5.0 * np.pi / 180 #steering limits for feedforward controller
		
		#Initialize force lookup tables for feedforward
		numTableValues = 250

		#values where car is sliding
		alphaFslide = np.abs(np.arctan(3*vehicle.muF*vehicle.m*vehicle.b/vehicle.L*vehicle.g/vehicle.Cf)) 
		alphaRslide = np.abs(np.arctan(3*vehicle.muR*vehicle.m*vehicle.a/vehicle.L*vehicle.g/vehicle.Cr))

		alphaFtable = np.linspace(-alphaFslide, alphaFslide, numTableValues)
		alphaRtable = np.linspace(-alphaRslide, alphaRslide, numTableValues) # vector of rear alpha (rad)
		
		#reshape to row vector
		self.alphaFtable = alphaFtable.reshape(numTableValues,1)
		self.alphaRtable = alphaRtable.reshape(numTableValues,1)

		FyFtable = tm.fiala(vehicle.Cf, vehicle.muF, vehicle.muF, self.alphaFtable, vehicle.FzF)
		FyRtable = tm.fiala(vehicle.Cr, vehicle.muR, vehicle.muR, self.alphaRtable, vehicle.FzR)

		#reshape to row vector
		self.FyFtable = FyFtable.reshape(numTableValues, 1)
		self.FyRtable = FyRtable.reshape(numTableValues, 1)


	def updateInput(self, localState, controlInput):
		delta, deltaFFW, deltaFB, K = _lanekeeping(self, localState)
		Fx, UxDes = _speedTracking(self, localState)
		controlInput.update(delta, Fx)
		auxVars = (K, UxDes)

		return controlInput, auxVars





def _force2alpha(forceTable, alphaTable, Fdes):
		if Fdes > np.max(forceTable):
			Fdes = max(forceTable) - 1

		elif Fdes < np.min(forceTable):
			Fdes = min(forceTable) + 1

		#note - need to slice to rank 0 for np to work
		alpha = np.interp(Fdes, forceTable[:,0] , alphaTable[:,0])

		return alpha


def _lanekeeping(sim,localState):
	
	#note - interp requires rank 0 arrays
	sTable = sim.path.s[:,0]
	kTable = sim.path.curvature[:,0]

	K = np.interp(localState.s, sTable, kTable) #run interp every time - this is slow, but we may be able to get away with	
	deltaFFW, betaFFW = _getDeltaFFW(sim, localState, K)
	deltaFB = _getDeltaFB(sim, localState, betaFFW)
	delta = deltaFFW + deltaFB
	return delta, deltaFFW, deltaFB, K


def _speedTracking(sim, localState):

	#note - interp requires rank 0 arrays
	AxTable = sim.profile.Ax[:,0]
	UxTable = sim.profile.Ux[:,0]
	sTable = sim.profile.s[:,0]
	m = sim.vehicle.m

	s = localState.s
	Ux = localState.Ux

	AxDes = np.interp(s, sTable, AxTable) #run interp every time - this is slow, but we may be able to get away with
	UxDes = np.interp(s, sTable, UxTable) #run interp every time - this is slow, but we may be able to get away with


	FxFFW = m*AxDes #+ np.sign(Ux)*fdrag*Ux^2 + frr*sign(Ux); # Feedforward
	FxFB = -sim.kSpeed*(Ux - UxDes) # Feedback
	FxCommand = FxFFW + FxFB
	return FxCommand, UxDes


def _getDeltaFB(sim, localState, betaFFW):
	kLK = sim.kLK
	xLA = sim.xLA
	e = localState.e
	deltaPsi = localState.deltaPsi

	deltaFB = -kLK * (e + xLA * np.sin(deltaPsi + betaFFW))
	return deltaFB

def _getDeltaFFW(sim, localState, K):
	a = sim.vehicle.a
	b = sim.vehicle.b
	L = sim.vehicle.L
	m = sim.vehicle.m

	Ux = localState.Ux


	FyFdes = b / L * m * Ux**2 * K
	FyRdes = a / b * FyFdes

	alphaFdes = _force2alpha(sim.FyFtable, sim.alphaFtable, FyFdes)
	alphaRdes = _force2alpha(sim.FyRtable, sim.alphaRtable, FyRdes)

	betaFFW = alphaRdes + b * K 
	deltaFFW = K * L + alphaRdes - alphaFdes

	return deltaFFW, betaFFW		

class ControlInput:
	def __init__(self):
		self.delta = 0.0
		self.Fx = 0.0

	def update(self, delta, Fx):
		self.delta = delta
		self.Fx = Fx






