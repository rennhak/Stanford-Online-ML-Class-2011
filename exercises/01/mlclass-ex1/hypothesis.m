function h = hypothesis(X, theta, iter)

  l   = length( theta );
  h   = 0;

  % sum up all theta and X's
  for i = 1:l
    h = h + ( theta(i) * X(iter,i) );
  end % of for i
end
