function S_per = barlett(signal, L)
  agg=[];
  N=length(signal);
  for c=1:N/L:N
    s=signal(c:c+N/L-1);
    per=compute_periodogram(s);
    agg=[agg; per'];
  end
  S_per=mean(agg);
end