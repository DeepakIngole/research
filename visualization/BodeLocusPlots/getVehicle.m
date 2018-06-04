function veh = getVehicle()

veh.a = 1.0441; 
veh.b = 1.4248; 
veh.m = 1.5124e+003; 
veh.Cf = 160000; 
veh.Cr = 180000;
veh.Iz = 2.2499e+003;
veh.xLA = 14.2;  %Set these to zero because we don't want to  
veh.kLK = .0538;  %have feedback acting the optimization
veh.muP = .925; 
veh.muS = .925;
veh.detune = .99182; %% get velocity profile just below the limits (set to 1 to use muP and muS in velocity profile calc)
veh.g = 9.81;
veh.L = veh.a+veh.b;
veh.FzF = veh.m/veh.L*(veh.b*veh.g); 
veh.FzR = veh.m/veh.L*(veh.a*veh.g); 
veh.Kug = veh.FzF/veh.Cf - veh.FzR/veh.Cr;
veh.alphaFslide = abs( atan(3*veh.muP*veh.FzF/veh.Cf) ); % this is the maximum permissible
veh.alphaRslide = abs( atan(3*veh.muP*veh.FzR/veh.Cr) ); % front and rear slip limits for the lookup table

veh.alphaFlim = min( 7 * (pi/180), veh.alphaFslide ); % for conservatism, we limit the FFW steering command
veh.alphaRlim = min( 5 * (pi/180), veh.alphaRslide ); % by placing limits on the alphaF and alphaR values

%Create Lookup Table
veh.alphaFrontTable = -veh.alphaFlim : 0.001 : veh.alphaFlim; % vector of front alpha [rad]
veh.alphaRearTable =  -veh.alphaRlim : 0.001 : veh.alphaRlim; % vector of rear alpha  [rad]

veh. FyFtable = tireforces( veh. Cf , veh. muP , veh. muS , veh. alphaFrontTable , veh. FzF );
veh. FyRtable = tireforces( veh. Cr , veh. muP , veh. muS , veh. alphaRearTable  , veh. FzR );

veh.aFmax =  8 * pi/180;
veh.aRmax =  6 * pi/180;

veh.throttleLimit = 3; %m/s^2
veh.brakeLimit = 9.5; %m/s^2


end