function [Ctil idx] = getLocalStiffness(alphaDes, Fy, alpha)


i = interp1(alpha,1:1:numel(alpha), alphaDes, 'nearest'); 
idx = i;
Ctil = (Fy(i+1) - Fy(i-1))/(alpha(i+1) - alpha(i-1));
