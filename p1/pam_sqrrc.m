% function y = pam_sqrrc(Nss, LS, roff, S, tim_err, freq_err)
%  
% BPSK SIGNAL GENERATION (SQUARE-ROOT RAISED COSINE)
% BASE-BAND EQUIVALENT
%
% - Input Parameters -
%
%   Nss      : number of samples per symbol.
%   LS       : length of shaping pulse in symbols.
%   roff     : roll-off.
%   S        : BPSK symbols (+1 and -1).
%   tim_err  : timing error.
%   freq_err : frequency error.
%
% - Output Parameters -
%
%   y        : output samples vector.
%
% _________________________________________________________________________
 
function y = pam_sqrrc(Nss, LS, roff, S)
tim_err = 0;
frq = 0;

% _________________________________________________________________________
% Initialize parameters

NS = length(S);                     			% number of symbols.
Lp = LS*Nss;     				    	% length of shaping pulse in samples


if( ((Lp/2) - ceil(Lp/2)) == 0 )  % ODD PATCHING
   Lp = Lp+1;
end;

Ly = (NS-1)*Nss+Lp;

if( nargin == 4 )
    tim_err = eps;
end

% _________________________________________________________________________
% Create pulse shaping pattern
% vector of time samples
t   =   -tim_err + 1e-6 + [-(Lp-1)/2:1:(Lp-1)/2]/Nss;	

% calculates square root raised cosine
p   =   (sin(pi*(1-roff)*t) + 4*roff*t.*cos(pi*(1+roff)*t))./(pi*t.*(1-(4*roff*t).^2));

% _________________________________________________________________________
% Generate output sequence

y = zeros(1,Ly);

for k=0:NS-1,			
    k1 = k*Nss+1;                   			% lower index
    k2 = k*Nss+Lp;                 			% higher index
    y(k1:k2) = y(k1:k2)+S(k+1)*p;  			% add new symbol        
end


% Include frequency error degradation.
frqerr = exp(i*(2*pi*frq*(0:(length(y)-1))));
y = y.*frqerr;
y = y.';

