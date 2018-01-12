function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Variable ans created for more readable code

ans = sigmoid(X*theta)

% First value of theta set to 0 because we do not regularize the bias term

theta(1) = 0;

% Cost function of logistic regression with a regularization term

J = (-1/m)*sum(y'*log(ans) + (1-y)'*(log(1-ans)))...
    + (lambda/(2*m))*(theta'*theta);

% Gradient of cost function with regularization 

grad = (1/m)*(X'*(ans - y)) + (lambda/m)*theta;


% =============================================================

end
