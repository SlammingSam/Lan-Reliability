% Define packets to run simulations for
packetsToRun = [1, 5, 15, 50, 100];

% Run simulation for each packet
for kIndex = 1:length(packetsToRun)
    % Get current packet number (k)
    k = packetsToRun(kIndex);
    
    % Create figure with grid on display
    figure(kIndex)
    grid on
    
    % Plot main results and figures
    hold on;
    title("k = " + k);
    Task_1Sim(k);
    hold off;
    
    % Calculate packet results (if applicable)
    hold on;  % Re-turn to plotting mode for calculation window
    figure(kIndex);  % put figure focus back on figure number
    Task_1Calc(k);
    hold off;
end
