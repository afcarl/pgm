function factors = ComputeTripletFactors (images, tripletList, K)
% This function computes the triplet factor values for one word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   tripletList: An array of the character triplets we will consider (other
%     factor values should be 1). tripletList(i).chars gives character
%     assignment, and triplistList(i).factorVal gives the value for that
%     entry in the factor table.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Hint: Every character triple in the word will use the same 'val' table.
%   Consider computing that array once and then resusing for each factor.
%
% Copyright (C) Daphne Koller, Stanford University, 2012


n = length(images);

% If the word has fewer than three characters, then return an empty list.
if (n < 3)
    factors = [];
    return
end

factors = repmat(struct('var', [], 'card', [], 'val', []), n - 2, 1);

% Your code here:
% Construct vals table
triplets = ones(K, K, K);
for i = 1:length(tripletList)
   triplets(tripletList(i).chars(1), tripletList(i).chars(2),...
       tripletList(i).chars(3)) = tripletList(i).factorVal;
end
triplets = reshape(triplets, K*K*K, 1);


for i = 1:n-2
    factors(i).var = [i i+1 i+2];
    factors(i).card = [K K K];
    factors(i).val = triplets;
end


end
