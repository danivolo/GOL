clc
close all
clear

%% Encryption

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);

Password = [3.9+0.1*rand(),rand()];
Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
Sequence = LogisticRandomSequence(Height*Width,Mu,X0); 
%Generates pseudorandom sequence with recursion rule 
%X(n+1) = Mu*X(n)*(1-X(n))

Iterations = 20; %Iterations of cellular automata


[LifeEncoded,H1] = Encoder(Image,Sequence,'Life',Iterations,1);
[FredkinEncoded,H2] = Encoder(Image,Sequence,'Fredkin',Iterations,1);

subplot(1,3,1)
imshow(Image)
subplot(1,3,2)
imshow(LifeEncoded)
subplot(1,3,3)
imshow(FredkinEncoded)

%% Correlation tests

fprintf("Correlation between pairs of adjacent pixels:\n"),
fprintf("Original: %f \n Life: %f \n Fredkin: %f \n\n", ... 
    CorrelationOfAdjacentPixels(Image),...
    CorrelationOfAdjacentPixels(LifeEncoded),...
    CorrelationOfAdjacentPixels(FredkinEncoded));

fprintf("Correlazione tra stessi pixel:\n")
fprintf(" Original-Life: %f\n Original-Fredkin: %f\n\n",...
    corr2(Image,LifeEncoded),...
    corr2(Image,FredkinEncoded));

%%Key sensitivity test

PerturbedSequence = Sequence;
ChangedIndex = randi(length(PerturbedSequence));
PerturbedSequence(ChangedIndex) = 1-PerturbedSequence(ChangedIndex);

PerturbedLifeEncoded = Encoder(Image,PerturbedSequence,'Life',1,Iterations);
PerturbedFredkinEncoded = Encoder(Image,PerturbedSequence,'Fredkin',1,Iterations);

fprintf("Correlation of images encrypted with password differing in a part in 10^12:\n")
fprintf(" Life: %f\n Fredkin %f\n",...
    corr2(LifeEncoded,PerturbedLifeEncoded),...
    corr2(FredkinEncoded,PerturbedFredkinEncoded));

