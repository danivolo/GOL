function NewImage = Permute(OldImage,History)
%Permutes matrix based on recorded history of binary cellular automata
%First come the pixels corrensponding to alive cells at t=1
%Then for every t come pixel corresponding to cells initially dead but
%alive at time t
%At the end, all the rest

Order = []; %This will be the new order
Correction = ones(size(History(:,:,1))); %No corrections at t=1
for t=1:size(History,3)
    CurrentBoard = History(:,:,t).*Correction;
    %Removes cells alive at previous times
    Order = cat(1,Order,find(CurrentBoard == 1)); 
    %Keep track of indices of newly alive cells
    Correction(CurrentBoard==1) = 0;
    %Sets zeros in indices corresponding to cells already counted
end
Order = cat(1, Order, find(Correction==1));

NewImage = reshape(OldImage(Order),size(OldImage,1),size(OldImage,2));
%Permutes image using linear indices and then reshapes it to its correct
%dimensions
end