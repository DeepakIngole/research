desTurns = 1:14;
ThunderHillAnalysis2Runs
hold on
tInit = 74;
tSim = 4000;
cd 'C:\Users\ddl\Desktop\nitinResearch\ThunderHillAnalysis\computeUxAx'
sim('UxAxGen')
s = simout(:,5);
Ux = simout(:,4);
Ax = simout(:,3);
Ax(Ax>2.5) = 2.5;

plot(s-s(1), Ux,'g','LineWidth',2)
cd ..