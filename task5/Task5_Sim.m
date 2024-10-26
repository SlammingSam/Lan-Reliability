function returnPlot = Task5_Sim(graphNum, K, p1, p2, p3)
kNumOfPackets = [];
pValues = 0.00:0.01:1;
nNumOfSimulations = 1000;
kNumOfPackets(end + 1) = K;
simulatedResults = zeros(length(kNumOfPackets), length(pValues));
kPackets = [];
ChanceOfFailure = [];

% Loop for each k num ===================================
for kIndex = 1:length(kNumOfPackets)
    k = kNumOfPackets(kIndex); % set K to be the current num of packets
    if k <= 0   % checks if k (num of packets) is less than or equal to zero (skips calculating)
    else
        % sim result loop ======================================
        if isnumeric(p1) && numel(p1) > 1
    disp("p1 is an array!")
    for pIndex = 1:length(p1)
        if p1(pIndex) >= 1 % if percent of failure is 100%, no packets can be sent.
            %disp("Packet Failure at 100% | skipping...")
        else
            p = p1(pIndex);
            simulatedResults(kIndex, pIndex) = runCustomCompoundNetworkSim(k, p1(pIndex), p2, p3, nNumOfSimulations);
            kPackets(end + 1) = simulatedResults(kIndex, pIndex);
            ChanceOfFailure(end + 1) = p1(pIndex);
            %disp(graphNum + " | " + k + " | "+ p)
        end
    end
elseif isnumeric(p2) && numel(p2) > 1
    disp("p2 is an array!")
    for pIndex = 1:length(p2)
        if p2(pIndex) >= 1 % if percent of failure is 100%, no packets can be sent.
            %disp("Packet Failure at 100% | skipping...")
        else
            p = p2(pIndex);
            simulatedResults(kIndex, pIndex) = runCustomCompoundNetworkSim(k, p1, p2(pIndex), p3, nNumOfSimulations);
            kPackets(end + 1) = simulatedResults(kIndex, pIndex);
            ChanceOfFailure(end + 1) = p2(pIndex);
            %disp(graphNum + " | " +k + " | "+ p)
        end
    end
elseif isnumeric(p3) && numel(p3) > 1
    disp("p3 is an array")
    for pIndex = 1:length(p3)
        if p3(pIndex) >= 1 % if percent of failure is 100%, no packets can be sent.
            %disp("Packet Failure at 100% | skipping...")
        else
            p = p3(pIndex);
            simulatedResults(kIndex, pIndex) = runCustomCompoundNetworkSim(k, p1, p2, p3(pIndex), nNumOfSimulations);
            kPackets(end + 1) = simulatedResults(kIndex, pIndex);
            ChanceOfFailure(end + 1) = p3(pIndex);
            %disp(graphNum + " | " +k + " | "+ p)
        end
    end
        end
    end
end

%plot ===================   
 resultTab = table(ChanceOfFailure, kPackets);
 set(gca, 'YScale','log')
 xlim([0, 1]);
 ylim([0, 1000]);
 xlabel("Chance of Failure (P)");
 ylabel("Transmitted packets (K)")

 hold on
 figure(graphNum)
 returnPlot = plot(resultTab, "ChanceOfFailure", "kPackets", Marker="o", LineStyle="none");

 %legend({'kPackets'},'Location','northeast')

end