function sigma = standardDeviation(II, x1, y1, x2, y2)
%input: average intensity u within rectangular region
%output: standard deviation sigma of the intensities within rectangular????
%region (upper-left (x1, y1) bottom-right (x2, y2))

u1 = averageIntensity(II.^2, x1, y1, x2, y2);
u2 = averageIntensity(II, x1, y1, x2, y2);
sigma = sqrt(u1 - u2^2);
