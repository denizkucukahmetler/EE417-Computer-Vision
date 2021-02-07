%% Linear Scaling
clc; clear; close all;

%Im = imread('city.png');
%Im = imread('petersburg.HEIC');
%Im = imread('hat.png');

%Im = imread('colored.jpg');

Im = imread('stars.JPG');
%Im =imread('wheel.JPG');


[Inew] = lab1inscale(Im);

%% Conditional Scaling
clc; clear; close all

%Im = imread('city.png');

%Iref = imread('board.jpg');

%Iref = imread('clouds.JPG'); %light ref
%Im = imread('seaandmoon.JPG'); %dark ref
Im = imread('money.JPG');
Iref = imread('nightcity.JPG');

[Jnew] = lab1condscale(Im,Iref);


%% Box Filter
clc; clear; close all
Im =imread('jump.png');
%Im = imread('rose.JPG');
%Im = imread('woman.JPG');
%Im = imread('noisy3.jpg');
Im = imread('man.JPG')
k =3;
[Inew] =lab1locbox(Im,k);

%% Local Min/max Filter
clc;clear; close all
Im =imread('currentImage.png');
%Im = imread('face.JPG');
%imread('standing.JPG');
k = 18;
[Imax, Imin] = lab1locmaxmin(Im,k);
