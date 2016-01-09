allAccuracy = [];
partAccuracy = load('../output/UBIRISAccuracy_1to300.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/UBIRISAccuracy_301to600.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/UBIRISAccuracy_601to900.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/UBIRISAccuracy_901to1203.mat');
allAccuracy = [allAccuracy; partAccuracy];

avgAccuracy = mean(allAccuracy)