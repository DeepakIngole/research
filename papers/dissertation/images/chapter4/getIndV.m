function [ indv ] = getIndV( s )


ind2 = find(s > 600 & s < 700);
ind3 = find(s > 800 & s < 1150);
ind4 = find(s > 1250 & s < 1570);
indv = union(ind2, ind3); indv = union(indv, ind4);


end

