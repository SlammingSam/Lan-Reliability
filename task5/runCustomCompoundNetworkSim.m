%% Function runCompoundNetwork()
% Parameters
%  K - the number of packets in the application message
%  p1 - the probability of failure 
%  p2 - the probability of failure 
%  p3 - the probability of failure 
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K,p1, p2, p3,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
    
        while pktSuccessCount < K
            
            r = rand; % generate random number to determine if packet is successful
            r1 = rand;% generate random number to determine if packet is successful
            r2 = rand;% generate random number to determine if packet is successful
            txAttemptCount = txAttemptCount + 1; % count 1st attempt
        
            % while packet transmissions is not successful (r < p)
            while (r < p1 && r1 < p2) || (r2 < p3)
                r = rand; % transmit again, generate new success check value r
                r1 = rand;% transmit again, generate new success check value r1
                r2 = rand;% transmit again, generate new success check value r2

                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end
        
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
    
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end

    result = mean(simResults);
end