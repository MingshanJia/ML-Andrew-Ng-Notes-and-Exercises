function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X, 2);

% You need to return the following variables correctly 
J = 0;
J_R = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i= 1:m
    z = theta' * X(i, :)';
    h = sigmoid(z);
    J = J + y(i) * log(h) + (1 - y(i)) * log(1 - h);
    
    grad = grad + (h - y(i)) * X(i, :)';
end

for j = 2:n
   J_R = J_R + theta(j)^2;
   grad(j) = grad(j) + lambda * theta(j);
end

J = - J / m + J_R * lambda / (2 * m);
grad = grad / m;


% =============================================================

end
