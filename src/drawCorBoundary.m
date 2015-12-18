function outputImage = drawCorBoundary( image, teacherAns)
%DRAWCORBOUNDARY draws the  correct answer of inner and outer boundaries 
%of given eye image.
%   outoutimage is the image with red correct boundary circles.
%   image is the eye graph we want to draw on
%   eyeNo is the image number in the answer database

teacherAns = round(teacherAns);

innerCenterPos = teacherAns(1:2);
innerCenterPos = fliplr(innerCenterPos);

innerDis = ones(1,181);
innerDis = teacherAns(3).*innerDis;

outerCenterPos = teacherAns(4:5);
outerCenterPos = fliplr(outerCenterPos);

outerDis = ones(1,181);
outerDis = teacherAns(6).*outerDis;

outputImage = drawRecogArea( image, innerCenterPos, innerDis, outerCenterPos, outerDis, 'red' );

end

