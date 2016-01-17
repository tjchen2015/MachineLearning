allAccuracy = [];
partAccuracy = load('../output/accuracy/ICEAccuracy_1to750.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/ICEAccuracy_751to1500.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/ICEAccuracy_1501to2250.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/accuracy/ICEAccuracy_2251to2953.mat');
partAccuracy = partAccuracy.accuracyMat;
allAccuracy = [allAccuracy; partAccuracy];

avgAccuracy = mean(allAccuracy)