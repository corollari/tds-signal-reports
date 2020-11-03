  fd=0.25;
  A=5;
  N=1000;
  n=(1:N)';
  thetas = zeros(1000, 1);
  for c=1:1000
    noise=randn(N, 1) + randn(N, 1)*i;
    noise=noise./abs(noise);
    x=A*cos(2*pi*fd.*n + 1) + noise;
    thetas(c) = estimate(n, x, fd);
  end
  subplot(2,1,1)
  plot(real(thetas))
  title('real')
  subplot(2,1,2)
  plot(imag(thetas))
  title('imag')