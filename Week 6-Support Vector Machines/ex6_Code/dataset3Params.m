function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Range of parameters to try

cList = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigmaList = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

% Create matrix to store cost values

M = ones(length(cList), length(cList))*-1;

for i = 1:length(cList)
   C = cList(i)   
   for j = 1:length(sigmaList)
       sigma = sigmaList(j)
       model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
       predictions = svmPredict(model, Xval);
       M(i,j) = mean(double(predictions ~= yval));
   end
end

% Convert matrix of cost values into a vector, save the minimum and its
% index

[costMin, idx] = min(M(:));

% Find the index of the minimum in terms of rows and columns

[idxRow, idxCol] = ind2sub(size(M),idx);

% Match the row with the index of the best C value and column with the best
% sigma value

C = cList(idxRow);
sigma = sigmaList(idxCol);

% Could use linear search algorithm and reset C and sigma for every new minimum we encounter
% This approach would be faster, but we would not save all the different error values for other parameters and perform error analysis

% =========================================================================

end
