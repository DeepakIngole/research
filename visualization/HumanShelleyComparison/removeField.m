function variablesNoField = removeField(variablesToPlot)

    variablesNoField = {};

    for i = 1:numel(variablesToPlot)
        strWithField = char(variablesToPlot(i));
        [token, strNoField] = strtok(strWithField,'.');
        
        if numel(strNoField) ==0
            variablesNoField(i) = {token};
        else
            variablesNoField(i) = {strNoField(2:end)};
        end
        
    end
    
end