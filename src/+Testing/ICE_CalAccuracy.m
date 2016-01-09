allAccuracy = [];
partAccuracy = load('../output/ICEAccuracy_1to750.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/ICEAccuracy_751to1500.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/ICEAccuracy_1501to2250.mat');
allAccuracy = [allAccuracy; partAccuracy];
partAccuracy = load('../output/ICEAccuracy_2251to2953.mat');
allAccuracy = [allAccuracy; partAccuracy];

avgAccuracy = mean(allAccuracy)