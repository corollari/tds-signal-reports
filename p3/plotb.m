 L=50;
 b=barlett(RxSignal, L);
 [f, real] = genTruePSD(Fs, length(b), 'GPS', false);
 %hold on
 %log_plot(b, Fs)
 %log_plot(real, Fs)
 % Second plot
 error=compute_error(b', Fs);
 ferror=fftshift(error)
 var(ferror(4e4:6e4))
 plot(f, error)