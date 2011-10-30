function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%


cost_sum  = 0;

for i = 1:m
  %a = theta'
  %b = X( i, : )
  %c = a .* b
  hyp_val   = theta' .* X(i,:);
end

hyp       = sigmoid( hyp_val );

for i = 1:m
  t1        = -y(i) * log( hyp );
  t2        = (1-y(i)) * log( 1 - hyp );

  t         = t1 - t2;
  cost_sum  += t;
end

J = (1/m) * cost_sum;

grad_sum  = 0;
n         = length( theta );

for i = 1:m
  for j = 1:n
    t1        = hyp - y(i);
    t2        = X(i,j);

    t         = t1 .* t2;
    grad_sum  += t;
  end % of for j
end % of for i

grad = (1/m) * grad_sum;


% =============================================================

end
