function [H, y, e]          =   algoritmeLMS(d, x, P, mu)
  N=length(x);
  y=zeros(N-P+1, 1);
  H=zeros(P, N-P+1);
  e=zeros(N-P+1, 1);
  inici=-P+1;
  
  for k=P:1:N
      y(inici+k)=H(:, inici+k)'*x(inici+k:k);
      e(inici+k)=d(k)-y(inici+k);
      H(:, inici+k+1)=H(:, inici+k)+(mu*e(inici+k)).*conj(x(inici+k:k));
  end
end