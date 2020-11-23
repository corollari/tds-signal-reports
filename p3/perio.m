function S_per = compute_periodogram(signal)
n=length(signal)
S_per=abs(fft(signal, 1024)).^2/n
S_per(1)=S_per(2)
end