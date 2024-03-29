function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length( X(1,:) );

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% Hypothesis
hypothesis      = sigmoid( X * theta );


% Penalties
first           = -y .* log( hypothesis );
second          = (1 - y) .* log( 1 - hypothesis );

% Cost
theta_rest      = theta;
theta_rest(1)   = 0; % lets just be lazy and remove the first element

J               = (1/m) * sum( first - second ) + ( (lambda/(2*m)) * sum( power( theta_rest, 2 ) ) );


% Gradient over all elements
for j = 1:n
  first         = hypothesis - y;
  second        = X(:,j);

  if( j == 0 )
    grad(j)       = (1/m) * sum( first .* second );
  else
    grad(j)       = (1/m) * ( sum( ( first .* second ) ) + ( lambda .* theta_rest(j) ) ) ;
  end
end % of for j




% =============================================================

end
