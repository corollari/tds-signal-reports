function FilteredSignal = overlap_add(RxSignal, h)

M=length(h);
Lr=length(RxSignal);
L=(M-1)*2; % Taken from the recomendation on the practical
N=L+M-1;
Hx=fft(h, N);
FilteredSignal=zeros(Lr+M-1, 1);

for x = 0:floor(Lr/L)
    len=L;
    initialPos=x*L+1;
    if (initialPos+len)>(Lr-1)
        len=Lr-initialPos;
        N=len+M-1;
        Hx=fft(h, N);
    end
    r=RxSignal(initialPos:initialPos+len-1);
    Rm=fft(r, N);
    Ym=Rm.*Hx;
    ym=ifft(Ym, N);
    endFiltered=initialPos+length(ym)-1;
    FilteredSignal(initialPos:endFiltered)=FilteredSignal(initialPos:endFiltered)+ym;
end

