function [I_edge] = lab3sobel(I, T)

[row, col, ch] = size(I);
if ch == 3
   Im = rgb2gray(I); 
end

[Gx, Gy] = lab2sobelfilt(Im); %using sobel filt, find the horizontal and vertical filtered im's
G_mag = sqrt(Gx.^2+Gy.^2); %find the gradient for each point
I_edge = zeros(size(G_mag)); 
I_edge(find(G_mag>T)) = 255; %check if the pixel gradient passes the treshold

figure;
subplot(2,3,1)
imshow(I)
title("original image");

subplot(2,3,2)
imshow(uint8(Gx))
title("x");

subplot(2,3,3)
imshow(uint8(Gy))
title("y");

subplot(2,3,5), imshow(uint8(G_mag))
title("gradient image");
subplot(2,3,6), imshow(uint8(I_edge))
title("edge image");

end