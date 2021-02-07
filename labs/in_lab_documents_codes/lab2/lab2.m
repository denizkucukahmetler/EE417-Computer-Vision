%% Part 1: Linear Filtering
clear all; close all; clc;
img = imread('rose.JPG');
ResImg = lab2gaussfilt(img);

figure
subplot(1, 2, 1)
imshow(img)
subplot(1,2,2)
imshow(ResImg)

%% Part 2: Non-linear Filtering (Median)
clear all; close all; clc;
img = imread('penguin.JPG');
k = 100;
[GaussianFiltered, Filtered_img] = lab2medfilt(img, k);

figure
subplot(1,3,1)
imshow(img)
subplot(1,3,2)
imshow(GaussianFiltered)
subplot(1,3,3)
imshow(Filtered_img)


%% Part 3: Sharpening
clear all; close all; clc;
img = imread('mother.png');
limbda = 15;
Mode = 3;
ResImg = lab2sharpen(img, limbda, Mode);

figure
subplot(1,2,1)
imshow(img)
title('Original Image');
subplot(1,2,2)
imshow(ResImg)
title('Sharpened Image');

%% Part 4: Sobel Filter 
clear all; close all; clc;
img = imread('bricks.JPG');
[x_filtered, y_filtered] = lab2sobelfilt(img); 

