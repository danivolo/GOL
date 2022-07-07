
function c = CorrelationOfAdjacentPixels(I)
%Sceglie n coppie casuali di pixel adiacenti e ne calcola la correlazione

n = 6000;
x1 = randi(size(I,1)-1,1,n);
y1 = randi(size(I,2)-1,1,n);
x2 = mod(x1+1,size(I,1)-1)+1;
y2 = mod(y1+1,size(I,2)-1)+1;

P1 = zeros(1,n);
P2 = zeros(1,n);
for i = 1:n
    P1(i) = I(x1(i),y1(i));
    P2(i) = I(x2(i),y2(i));
end

c = corr2(P1,P2);
end