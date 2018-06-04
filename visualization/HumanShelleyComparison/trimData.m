
for i = 1:numel(variablesToPlot)
    Plot1.(char(genvarname(variablesNoField(i)))).Lap1 = eval(['Run1.' char(variablesNoField(i)) '(Run1.Lap1.AllIndices(Run1.Lap1.desiredTurnsOnly))']);
    Plot1.(char(genvarname(variablesNoField(i)))).Lap2 = eval(['Run1.' char(variablesNoField(i)) '(Run1.Lap2.AllIndices(Run1.Lap2.desiredTurnsOnly))']);
    Plot2.(char(genvarname(variablesNoField(i)))).Lap1 = eval(['Run2.' char(variablesNoField(i)) '(Run2.Lap1.AllIndices(Run2.Lap1.desiredTurnsOnly))']);
    Plot2.(char(genvarname(variablesNoField(i)))).Lap2 = eval(['Run2.' char(variablesNoField(i)) '(Run2.Lap2.AllIndices(Run2.Lap2.desiredTurnsOnly))']);
end

clear Run1 Run2