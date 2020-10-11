function [FilteredSignal] = overlap_add(RxSignal,h)
%Performs convolution of 2 signals, by parts of 100 signs each iteration.

% Step 1
M = length(h);
L = M * 2;
N = L+M-1;
hF = fft(h, N);

%Step 2
FilteredSignal = zeros(M -1 + length(RxSignal), 1);
i = 1;
while i < length(RxSignal)
   if i + L > length(RxSignal)
       L = length(RxSignal) - i;
       N = L + M - 1;
       hF = fft(h, N);
       %hF = hF.';
   end
   Rm = fft(RxSignal(i:(i+(L-1))), N);
   if(L < 2)
       Rm = Rm.';
   end
   multF = Rm .* hF;
   mult = ifft(multF, N);

   FilteredSignal(i:i+N-1) = FilteredSignal(i:i+N-1) + mult;
   i = i + L;
end
end