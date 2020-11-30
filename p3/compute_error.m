function error=compute_error(est, Fs)
  [f, real] = genTruePSD(Fs, length(est), 'GPS', false);
  real=real./max(real);
  est=est./max(est);
  error=abs(real-est);
end