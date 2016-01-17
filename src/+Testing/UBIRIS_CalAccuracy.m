allAccuracy = [];
partAccuracy = load('../output/accuracy/UBIRISAccuracy_1to300.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/UBIRISAccuracy_301to600.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/UBIRISAccuracy_601to900.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/UBIRISAccuracy_901to1203.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];

avgAccuracy = mean(allAccuracy)