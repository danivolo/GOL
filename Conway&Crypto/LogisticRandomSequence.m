function Sequence = LogisticRandomSequence(Length,Mu,X0)
%Genera una sequenza di N float tra 0 e 1 tramite mappa logistica

Sequence = zeros(1,Length);
Sequence(1) = X0;
for i=1:Length-1
    Sequence(i+1) = Mu*Sequence(i)*(1-Sequence(i));
end
end
