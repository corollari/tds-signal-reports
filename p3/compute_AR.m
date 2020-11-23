function S_AR = compute_AR(signal, p)
  N=length(signal);
  rx=xcorr(signal, 'biased');
  rx=rx(N:end);
  r=rx(2:p+1);
  R=toeplitz(rx(1:p), conj(rx(1:p)));
  ar=-inv(R)*r;
  a=[1; ar];
  sigma=rx(1)+ar'*r
  sigma=real(sigma); % Remove e-12i numerical error
  S_AR=sigma./(abs(fft(a, N)).^2);
end