p=1000
s=compute_AR(RxSignal, p);
 [f, real] = genTruePSD(Fs, length(s), 'GPS', false);
 %hold on
 %log_plot(s, Fs)
 %log_plot(real, Fs)
 % Second plot
 error=compute_error(s, Fs);
 ferror=fftshift(error);
 var(ferror(4e4:6e4))
 plot(f, error)