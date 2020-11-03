  nn=10:100:10000;    
  MSEs = zeros(length(nn), 1);
  CRLBs = zeros(length(nn), 1);
  for N=nn
    n=(1:N)';
    K=1000;
    thetas = zeros(K, 1);
    for c=1:K
      noise=randn(N, 1) + rand(N, 1)*i;
      noise=noise./abs(noise);
      x=A*cos(2*pi*fd.*n + 1) + noise;
      thetas(c) = estimate(n, x, fd);
    end
    bias=mean(thetas')-1;
    variance=var(thetas');
  
    c=ceil(N/100);
    CRLBs(c)=2/(N*A^2);
    MSEs(c)=real(bias)^2+variance;
  end
  hold on
  plot(nn, MSEs)
  plot(nn, CRLBs)