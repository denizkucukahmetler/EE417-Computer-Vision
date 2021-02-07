clear all; close all; clc;
% Load the files given in SUcourse as Seq variable
load('traffic.mat');
load('sphere.mat');
load('rubic.mat');
load('taxi.mat');
load('cars1.mat');
load('cars2.mat');

Seq=taxi;

[row,col,num]=size(Seq);
% Define k and Threshold
k=30; Threshold = 2*10^6; %threshold for the eigenvalues
for j=2:1:num
    ImPrev = Seq(:,:,j-1)
    ImCurr = Seq(:,:,j)
    lab6OF(ImPrev,ImCurr,k,Threshold);
    pause(0.1);
end

