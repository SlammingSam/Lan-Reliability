function losingMySanity = Task4_Calc(k)
% k / (1-p)^2
pValues = 0.00:0.01:1;
kPackets = [];

for pIndex = 1:length(pValues)
    kPackets(end + 1) = k / ((1 - (pValues(pIndex)* pValues(pIndex))) * (1 - pValues(pIndex)));
    disp(kPackets(end))
end 

% Create a table combining pValues and kPackets for plotting
resultTab = table(pValues, kPackets); 

% Plot the data from the result table
graph1 = plot(resultTab, "pValues", "kPackets"); 

% Set the figure to number 6
figure(6); 
hold on

% Plot again to ensure visibility
graph2 = plot(resultTab, "pValues", "kPackets"); 

% Set the y-axis to a logarithmic scale for better visibility of values
set(gca, 'YScale', 'log') 

% Set x-axis limits from 0 to 1
xlim([0, 1]); 

% Set y-axis limits from 0 to 1000
ylim([0, 1000]); 

% Change plot color based on the value of k
if k == 1
    set(graph1, "Color", "black") % Set color for k = 1
    set(graph2, "Color", "black") 
elseif k == 5
    set(graph1, "Color", "magenta") % Set color for k = 5
    set(graph2, "Color", "magenta") 
elseif k == 10
    set(graph1, "Color", "green") % Set color for k = 10
    set(graph2, "Color", "green") 
elseif k == 15
    set(graph1, "Color", "red") % Set color for k = 15
    set(graph2, "Color", "red") 
elseif k == 50
    set(graph1, "Color", "cyan") % Set color for k = 50
    set(graph2, "Color", "cyan") 
elseif k == 100
    set(graph1, "Color", "blue") % Set color for k = 100
    set(graph2, "Color", "blue") 
end
