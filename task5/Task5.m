packetsToRun = [1, 5, 10];
a = 0.10;
b = 0.60;
c = 0.01:0.01:0.99;

runTask5Sim(packetsToRun, 1, a, b, c)
runTask5Sim(packetsToRun, 2, b, a, c)
runTask5Sim(packetsToRun, 3, a, c, b)
runTask5Sim(packetsToRun, 4, b, c, a)
runTask5Sim(packetsToRun, 5, c, a, b)
runTask5Sim(packetsToRun, 6, c, b, a)
