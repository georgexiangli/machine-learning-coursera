function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


% find indices of positive (admitted) and negative (non admitted) examples
% use boolean comparison

pos = find(y == 1);
neg = find(y == 0);

% within data matrix X, select students who were admitted
% plot first score on x axis and second score on y axis
% markers indicate pass/fail

plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, ...
'MarkerSize', 7);

% repeat for negative values
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);




% =========================================================================



hold off;

end
