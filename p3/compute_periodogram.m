function S_per = compute_periodogram(signal)
N=length(signal)
S_per=abs(fft(signal, 1e5)).^2/N;
S_per(1)=S_per(2);
end