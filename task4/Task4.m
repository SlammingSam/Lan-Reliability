% Define packets to run simulations for
packetsToRun = [1, 5, 15, 50, 100];

% Run simulation for each packet
for kIndex = 1:length(packetsToRun)
    % Get current packet number (k)
    k = packetsToRun(kIndex);
    
    % Create figure with grid
    figure(kIndex)
    grid on
    
    % Plot 
    hold on;
    title("k = " + k);
    Task4_Sim(k);
    hold off;
    
    % Calculate packet results 
    hold on; 
    figure(kIndex); 
    Task4_Calc(k);
    hold off;
end