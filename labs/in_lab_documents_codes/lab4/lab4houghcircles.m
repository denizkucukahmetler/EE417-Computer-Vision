function [centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(I)
[r,c,s] = size(I);
if (s ==3)
    img = rgb2gray(I);
end

Rmin = 20;
Rmax = 60;
Sens = -8.1;

[centersBright, radiiBright] = imfindcircles(I,[Rmin Rmax],'ObjectPolarity','bright','Sensitivity',Sens);

[centersDark, radiiDark] = imfindcircles(I,[Rmin Rmax],'ObjectPolarity','dark', 'Sensitivity', Sens);

[centersNormal, radiiNormal] = imfindcircles(I,[Rmin Rmax]); %normal

imshow(I),title(sprintf('Detected Circles',Rmin,Rmax,Sens)), hold on

viscircles(centersNormal, radiiNormal,'Color','b');
title("Normal")

subplot(3,1,1)
imshow(I)
hold
viscircles(centersBright, radiiBright,'Color','b');
title("Bright");

subplot(3,1,2)
imshow(I)
hold
viscircles(centersDark, radiiDark,'Color','b');
title("Dark");

subplot(3,1,3)
imshow(I)
viscircles(centersBright, radiiBright,'Color','b');
viscircles(centersDark, radiiDark,'LineStyle','--');
end