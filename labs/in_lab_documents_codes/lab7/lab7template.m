%% first
close all; clear all; clc;

% Read the image L and R
img_L_RGB = imread('S01L.png');
img_R_RGB = imread('S01R.png');

% Convert to grayscale
img_L = rgb_to_gray(img_L_RGB);
img_R = rgb_to_gray(img_R_RGB);

%% Window size parameters
k = 3; 
omega  = 50; % Searching distance
offset = omega + k;

%% Padding for the offset

paddedIm_L = padarray(img_L,[offset offset], 'both');

paddedIm_R = padarray(img_R,[offset offset], 'both');
%% Calculate Disparity

[ydim, xdim , ch] = size(img_L);
disparity = zeros(ydim,xdim);

for xL = offset+1:1:xdim-offset-1
   for yL = offset+1:1:ydim-offset-1
        dist = [];
        leftWindow = paddedIm_L(yL-k:yL+k,xL-k:xL+k);
         for xR = xL:-1:xL-omega
             rightWindow = paddedIm_R(yL-k:yL+k,xR-k:xR+k);
             ssd = sum((rightWindow- leftWindow) .^2);
             dist= [dist; xL xR ssd];
         end 
        ind = find(dist(:,3) == min(dist(:,3))); % mininum
        xR = dist(ind(1),2);
        d = xL - xR;
        disparitymap(yL,xL) =d; %xleft - xright
     end
end

 disparitymap=(uint8(disparitymap));

%% Visualization
% Show stereo pair in a red-cyan anaglyph
paddedIm_L = uint8(paddedIm_L);
paddedIm_R = uint8(paddedIm_R);
imshow(stereoAnaglyph(paddedIm_L, paddedIm_R));

% Show disparity map with colorbar
figure
imagesc(disparitymap)
colormap jet
colorbar

%% RGB to grayscale function + double transformation
function [img_new]=rgb_to_gray(img)
[~, ~, ch]=size(img);
    if ch==3
        img_new_ = rgb2gray(img);
        img_new  = double(img_new_);
        else
            img_new = double(img);
    end
end