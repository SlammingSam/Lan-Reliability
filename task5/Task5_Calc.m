function losingMySanity = Task4_Calc(k)
pValues = 0.00:0.01:1;
kPackets = [];

for pIndex = 1:length(pValues)
    kPackets(end + 1) = k / ((1 - (pValues(pIndex)* pValues(pIndex))) * (1 - pValues(pIndex)));
    disp(kPackets(end))
end 
%plotting ==================
 resultTab = table(pValues, kPackets);

  plot(resultTab, "pValues", "kPackets");

  figure(6)
  hold on
  plot(resultTab, "pValues", "kPackets");

 set(gca, 'YScale','log')
 xlim([0, 1]);
 ylim([0, 1000]);