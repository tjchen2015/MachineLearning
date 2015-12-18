function correct = accuracy( ourAns, teacherAns )
%ACCURACY computes accuracy of our segmentation result. The formula is
%define as Accuracy = Error^2/Max_error^2. Error = norm(ourAns -
%teacherAns). Max_error^2 = e1 + e2 + e3 + e4. e1 = e3 = (n^2 + m^2)/4. n is #
%of row, m is # of column. e2 = r_hat/4. r_hat is the expected distance of inner
%boundary. e4 = R_hat/4. R_hat is the expected distance of outer boundary. 
%   correct is the percentage of the accuracy form scale 0 to 100
%   ourAns is our computed answer
%   teacherAns is the given answer from teacher's database

ourAns = round(ourAns);
error = ourAns - teacherAns;
error = error.^2;

%determine max square error for two center points
scaleP = 0.5;
size = [480, 640];
nsize = size.^2;
nsize =sum(nsize);
maxe1e3 = scaleP*nsize;

%determine max square error for two radii
scaleR = 0.5;
maxe2 = scaleR.^2.*teacherAns(3);
maxe4 = scaleR.^2.*teacherAns(6);

%sum up all max error to define error rate
maxError = maxe1e3+maxe2+maxe4;
error = sum(error)/maxError;

% if error over 100% then set it as 100%
if error>1
    error = 1;
end

correct = 1-error;
correct = 100*correct;
correct = round(correct, 2);

end

