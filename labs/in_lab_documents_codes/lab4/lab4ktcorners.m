function [corners] = lab4tkcorners(img)
[r,c,s] = size(img);
if (s ==3)
    img = rgb2gray(img);
end

img = double(img);

k=1;
threshold = 40000;
corners = [];

Simg = imgaussfilt(img);


[Gx,Gy] = imgradientxy(Simg); 

for i = k+1:1:r-k-1
    for j=k+1:1:c-k-3
        windowX = Gx(i-k:i+k,j-k:j+k);
        windowY = Gy(i-k:i+k,j-k:j+k);
        
        window_Xsquared= windowX .* windowX;
        window_XY = windowX .* windowY;
        window_Ysquared= windowY .* windowY;
        
        window_Xsquared= sum(window_Xsquared(:));
        window_XY= sum(window_XY(:));
        window_Ysquared= sum(window_Ysquared(:));
        
        H = [window_Xsquared, window_XY;
             window_XY, window_Ysquared];
         
        eigen = eig(H);%Find Eigen Values
        
        eigen_value1 = eigen(1);
        eigen_value2 = eigen(2);
        
        if (min(eigen_value1,eigen_value2) > threshold)
            corners = [corners; j,i];
        end
        
    end
end
img = int8(img);
figure
imshow(img)
hold on;
plot(corners(:,1),corners(:,2),'r*', 'MarkerSize',4,'Linewidth',1);
title('Kanade-Tomasi corner detection');
end