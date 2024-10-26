function packetSimResults = Task3_Sim(K)
% This function simulates packet transmission based on the number of packets K
% and various probabilities of failure, then plots the results.

% Initialize an empty array for number of packets
kNumOfPackets = []; 

% Define a range of p values from 0.01 to 1 with increments of 0.01
pValues = 0.01:0.01:1; 

% Set the number of simulations to run
nNumOfSimulations = 1000; 

% Add the input K to the number of packets array
kNumOfPackets(end + 1) = K; 

% Initialize a matrix to store simulation results
simulatedResults = zeros(length(kNumOfPackets), length(pValues)); 

% Initialize empty arrays for packets and chance of failure
kPackets = []; 
ChanceOfFailure = []; 

% Loop for each number of packets (k) ==============================
for kIndex = 1:length(kNumOfPackets)
    k = kNumOfPackets(kIndex); % Set k to the current number of packets
    if k <= 0   % Check if k is less than or equal to zero (skip calculation if true)
        continue; % Skip to the next iteration
    else
        % Simulation result loop ======================================
        for pIndex = 1:length(pValues)
            if pValues(pIndex) >= 1 % If probability of failure is 100%, skip the simulation
                % disp("Packet Failure at 100% | skipping...")
            else
                p = pValues(pIndex); % Set the current probability of failure
                
                % Run the simulation for the given k and p, storing the result
                simulatedResults(kIndex, pIndex) = runTwoParallelLinkSim(k, p, nNumOfSimulations);

                % Store the number of packets that were successfully transmitted
                kPackets(end + 1) = simulatedResults(kIndex, pIndex);

                % Store the current probability of failure
                ChanceOfFailure(end + 1) = pValues(pIndex);
            end
        end
    end
end

% Plotting the results ============================================
resultTab = table(ChanceOfFailure, kPackets); % Create a table for plotting
set(gca, 'YScale', 'log') % Set y-axis to logarithmic scale
xlim([0, 1]); % Set x-axis limits from 0 to 1
ylim([0, 1000]); % Set y-axis limits from 0 to 1000
xlabel("Chance of Failure (P)"); % Label for x-axis
ylabel("Transmitted packets (K)"); % Label for y-axis

% Plot 
graph1 = plot(resultTab, "ChanceOfFailure", "kPackets", Marker="o", LineStyle="none");

% Set the figure to number 6
figure(6) 
hold on

% Plot again for visibility
graph2 = plot(resultTab, "ChanceOfFailure", "kPackets", Marker="o", LineStyle="none");

% Change plot color based on the value of k
if K == 1
    set(graph1, "Color", "red") % Set color for K = 1
    set(graph2, "Color", "red")
elseif K == 5
    set(graph1, "Color", "cyan") % Set color for K = 5
    set(graph2, "Color", "cyan")
elseif K == 10
    set(graph1, "Color", "magenta") % Set color for K = 10
    set(graph2, "Color", "magenta")
elseif K == 15
    set(graph1, "Color", "blue") % Set color for K = 15
    set(graph2, "Color", "blue")
elseif K == 50
    set(graph1, "Color", "green") % Set color for K = 50
    set(graph2, "Color", "green")
elseif K == 100
    set(graph1, "Color", "yellow") % Set color for K = 100
    set(graph2, "Color", "yellow")
end
end
