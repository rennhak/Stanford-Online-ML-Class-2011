function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


for iter = 1:num_iters

  % ====================== YOUR CODE HERE ======================
  % Instructions: Perform a single gradient step on the parameter vector
  %               theta. 
  %
  % Hint: While debugging, it can be useful to print out the values
  %       of the cost function (computeCost) and gradient here.
  %

  theta_vals = theta;

  for j = 1:length(theta)

    cost_sum = 0;

    for i = 1:m
      cost_sum  = cost_sum + ( ( hypothesis( X, theta, i ) - y(i) ) * X(i,j) );
    end % of for i

    theta_vals(j) = theta(j) - ( alpha * (1/m) ) * cost_sum;
  end % of for j
 
  theta(1) = theta_vals(1);
  theta(2) = theta_vals(2);
  
  % ============================================================

  % Save the cost J in every iteration    
  J_history(iter) = computeCost(X, y, theta)

end

end
