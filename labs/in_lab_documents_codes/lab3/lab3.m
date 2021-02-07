%% Lab3 Edge Detection

%% Sobel Operator
clear all;close all;clc;
img = imread('peppers.png');
T =100;
I_edge = lab3sobel(img, T);


%% Problem 2: Prewitt
clear all;close all;clc;
img = imread('eye.JPG');
T = 5;
I_edge = lab3prewitt(img, T);

%% Problem 3: Laplacian 

clear all;close all;clc;
I2 = imread('eye.JPG');
G = lab3log(I2, 10000000000000000, 5); %t1: noise treshold, t2: slope treshold