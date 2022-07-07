clc
close all
clear
%Script solo per testare ogni tanto gli algoritmi di evoluzione


N = 10;

k = 100;

gol = randi(2,N,N)-1;
gol2 = gol;

figure(1)
for i=1:k
    subplot(1,2,1)
    imshow(gol)
    gol = Evolve(gol,'Fredkin');
    subplot(1,2,2)
    imshow(gol2)
    gol2 = Evolve(gol2,'Life');
    i
    pause
end
