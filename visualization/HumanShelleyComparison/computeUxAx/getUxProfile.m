function [UxDesired S] = getUxProfile

sim('UxAxGen.mdl')
UxDesired = simout(:,4);
S = simout(:,5);

end