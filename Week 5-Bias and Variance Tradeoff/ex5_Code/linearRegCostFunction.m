function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% This step is taken care of in script

% Exclude bias term from regularization
ntheta = theta(2:end);

J = (1/(2*m))*sum((X*theta - y).^2) + (lambda/(2*m))*sum((ntheta).^2);

R = (lambda*theta)/m;
R(1) = 0;

% For each row of grad, multiply one row of X' by the error

grad = (1/m).*X'*(X*theta - y) + R;








% =========================================================================

grad = grad(:);

end
