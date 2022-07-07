clc
close all
clear

tic
N = 1e6;
V = Bin2Thirtytwo(FredkinPRNG(N));
toc
dlmwrite('test.txt',V,'delimiter',' ','precision',12)