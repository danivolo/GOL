function New = Bin2Thirtytwo(Old)
%Converte sequenze di 32*N zeri/uni in sequenze di N interi 32-bit unsigned
Powers = 2.^(0:31);
Divided = reshape(Old,[],32);
New = Divided*Powers';
end