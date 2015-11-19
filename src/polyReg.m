function polyRegVector = polyReg( vector, degree)
%POLYREG gets the corresponding polynomial regression vector with the given
%input vecor.
%   polyRegVector - regressed vector
%   vector - a input vector
%   degree -  the highest degree used in polynomial regression, here we
%                      recommend 9

L = length(vector);
x = 1:L;
p = polyfit(x, vector, degree);
polyRegVector = polyval(p, x);

end

