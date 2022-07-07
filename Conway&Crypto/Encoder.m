
function [OutputImage,CAHistory] = ...
    Encoder(Image,Sequence,Rule,Iterations,FillParameter)
%Encrypts given image by permutating its pixel values according to
%evolution of Game of Life cellular Automata generated from given 
%password via logistic map

Height = size(Image,1);
Width = size(Image,2);
Board = reshape(round(Sequence.^FillParameter),Height,Width);
%Generates board starting from pseudorandom sequence, with fill percentage
%depending on FillParameter

CAHistory = zeros(Height,Width,Iterations);

for t = 1:Iterations
    CAHistory(:,:,t) = Board; 
    Board = Evolve(Board,Rule);
end
%Records History

RowPermuted = Permute(Image,CAHistory); %Permutes rows
OutputImage = Permute(RowPermuted',CAHistory)'; %Permutes columns

end