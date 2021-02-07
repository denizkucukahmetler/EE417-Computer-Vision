function [Inew] = lab1locbox(Im, k)

[h, w, c] = size(Im);

%check if the image is gray, if not - make it gray
if c==3
    Im = rgb2gray(Im);
end

I = double(Im);
Inew = I;

for i= k+1:h-k
   for j= k+1:w-k
       wp = I(i-k:i+k, j-k:j+k);
       Inew(i,j) = mean(wp(:));
   end
end

Inew = uint8(Inew);

end