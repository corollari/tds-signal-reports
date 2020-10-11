function DetSymbols = symDetector(DecimatedSignal)

angles=atan2(imag(DecimatedSignal), real(DecimatedSignal));
DetSymbols=zeros(length(angles),1);
l=sqrt(1/2)

for i=1:length(angles)
    a=angles(i);
    if a>0
        if a<(pi/2)
            DetSymbols(i)=l+ l*j;
        else
            DetSymbols(i)=-l+ l*j;
        end
    else
        if a<(-pi/2)
            DetSymbols(i)=-l -l*j;
        else
            DetSymbols(i)=l -l*j;
        end
    end
end