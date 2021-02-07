%% Question1 Corner Detection

clear all;close all;clc;
tic

img = imread('building1.jpg');
imshow(img);
Corners_Filtered = lab4ktcorners(img);
toc


%% Question2 Hough Lines

clear all;close all;clc;
tic
img = imread('building1.jpg');
[H,theta,rho] = lab4houghlines(img);
toc

%% Question3 Hough Circles 

clear all; close all;clc;
tic
img = imread('coins.jpg');
[centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(img);
toc

