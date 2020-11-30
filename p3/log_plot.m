function log_plot(S, Fs)
  N=length(S);
  x=-Fs/2:Fs/(N-1):Fs/2;
  y=10*log10(fftshift(S));
  plot(x, y)
end