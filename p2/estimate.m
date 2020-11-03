function [theta] = estimate(n, x, fd)
  upper=sum(x.*sin(2*pi*fd*n));
  lower=sum(x.*cos(2*pi*fd*n));
  theta=-atan(upper./lower);
end