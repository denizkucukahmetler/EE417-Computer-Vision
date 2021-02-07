function [I_edge] = lab3prewitt(I, T)

[row, col, ch] = size(I);
if ch == 3
   I = rgb2gray(I); 
end

I = double(I);
Sx = [-1 0 1;-1 0 1;-1 0 1];
Sy = [-1 -1 -1; 0 0 0; 1 1 1];

k = 1;

Gx = zeros(size(I));
Gy = zeros(size(I));

for i = k+1:1:row-k-1  
    for j = k+1:1:col-k-1
        window = I(i-k:i+k,j-k:j+k);
        Xvalue = sum(sum(window.*Sx)); %pointwise convo with the mask defined above
        Yvalue = sum(sum(window.*Sy));
        Gx(i,j) = Xvalue;
        Gy(i,j) = Yvalue;
    end 
end

G_mag = sqrt(Gx.^2 + Gy.^2);

I_edge = zeros(size(G_mag));

I_edge(find(G_mag > T)) = 255;

Gx = uint8(Gx);
Gy = uint8(Gy);
G_mag = uint8(G_mag);
I_edge = uint8(I_edge);
I = uint8(I);
figure;
subplot(2,3,1)
imshow(I)
title("original");

subplot(2,3,2)
imshow(Gx)
title("x");

subplot(2,3,3)
imshow(Gy)
title("y");

subplot(2,3,5)
imshow(G_mag)
title("gradient image");
subplot(2,3,6)
imshow(I_edge)
title("edge image");

end