function [] = plot6(N)
  fd=0.25;
  A=5;
  n=(1:N)';
  K=1000;
  thetas = zeros(K, 1);
  for c=1:K
    noise=randn(N, 1) + rand(N, 1)*i;
    noise=noise./abs(noise);
    x=A*cos(2*pi*fd.*n + 1) + noise;
    thetas(c) = estimate(n, x, fd);
  end
  plot(abs(thetas))
  N
  bias=mean(thetas')-1
  variance=var(thetas')