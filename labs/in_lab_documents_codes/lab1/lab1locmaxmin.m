function [Imax, Imin] = lab1locmaxmin(Im, k)

[h, w, c] = size(Im);

if c==3
    Im = rgb2gray(Im);
end

I = double(Im);

Imax = zeros(h,w);
Imin = zeros(h,w);

for i= k+1:h-k
   for j= k+1:w-k
       wp = I(i-k:i+k, j-k:j+k);
       Imax(i,j) =max(wp(:));
       Imin(i,j) =min(wp(:));
   end
end

Imax = uint8(Imax);
Imin = uint8(Imin);

subplot(1,3,1), imshow(Im);
title("Original Image");
subplot(1,3,2), imshow(Imax);
title("local max filtered");
subplot(1,3,3), imshow(Imin);
title("local min filtered");
end

