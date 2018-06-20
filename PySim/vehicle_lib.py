import numpy as np
import tiremodels as tm
#Defines a vehicle class, with full parameters

#Defaults to shelley variables
class Vehicle:
	def __init__(self): 
		
		self.tireType = tireType
		self.a = 1.0441 #CG to front wheelbase [m]
		self.b = 1.4248 #CG to rear wheelbase [m] 
		self.m = 1512.4 #vehicle mass (kg)
		self.Cf = 160000.0 #vehicle cornering stiffness (N)
		self.Cr = 180000.0 #vehicle cornering stiffness (N)
		self.Iz  = 2.25E3  #vehicle inertia (kg  m^2)
		self.muF = .97     #front friction coeff
		self.muR = 1.02    #rear friction coeff
		self.g = 9.81      #m/s^2, accel due to gravity
		self.L = self.a + self.b #total vehicle length, m
		self.FzF = self.m*self.b*self.g/self.L   #Maximum force on front vehicles
		self.FzR = self.m*self.a*self.g/self.L   #Maximium force on rear vehicles
		self.D = 0.3638 #Drag coefficient
		self.h = 0.75   #Distance from the ground
		self.brakeTimeDelay = 0.25 #Seconds
		self.rollResistance = 255.0 #Newtons
		self.Kx = 3000.0; #Speed tracking gain
		self.maxSpeed = 99
		self.powerLimit = 16000.0 #Watts

		# if tireType is "linear":
		#  	self.FyFtable = -self.Cf*self.alphaFtable
		#  	self.FyRtable = -self.Cr*self.alphaRtable
			
		# elif tireType is "nonlinear":
		#  	self.FyFtable = tm.fiala(self.Cf, self.muF, self.muF, self.alphaFtable, self.FzF)
		#  	self.FyRtable = tm.fiala(self.Cr, self.muR, self.muR, self.alphaRtable, self.FzR)

		# else:
		# 	print("Accepted tire types are linear or nonlinear") 




