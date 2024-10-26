function graphing = runTask5Sim(packetsToRun, graphIndex, a, b, c)

figure(graphIndex)
title("Graph = " + graphIndex)
grid on
hold on

% sets color of lines
for kIndex = 1:length(packetsToRun)
    k = packetsToRun(kIndex);
    graph =    Task5_Sim(graphIndex, k, a, b, c)
    if kIndex == 1
        set(graph, "Color", "r")
    elseif kIndex == 2
        set(graph, "Color", "g")
    elseif kIndex == 3
        set(graph, "Color", "b")
    end
    
    hold off
end

end