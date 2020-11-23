%
% ===========================================
% ===        GENERATION OF TRUE PSDs      ===
% === GPS L1 C/A and GALILEO E1-C SIGNALS ===
% === Sergi Locubiche Serra (PhD) :: UAB  ===
% ===========================================
%
% Inputs
% -> Fs                 ::  sampling frequency in [Hz].
% -> N                  ::  number of samples determining resolution.
% -> mode               ::  'GPS' or 'GAL'.
% -> plotResult         ::  flag to enable/disable plotting result.
%
% Outputs
% -> f                  ::  uncentered frequency axis in [Hz].
% -> truePSD            ::  generated PSD (uncentered).
%


function [f, truePSD]   =   genTruePSD( Fs, N, mode, plotResult )


%%

Fsub                    =   1 * 1.023e6;
Fc                      =   1 * 1.023e6;
Tc                      =   1 / Fc;

f                       =   linspace(-Fs/2, Fs/2, N);

switch mode
    case 'GPS'
        truePSD         =   Tc * sinc(f * Tc) .^ 2;
    case 'GAL'
        truePSD         =   Tc * sinc(f * Tc) .^2 .* tan(pi * f / (2 * Fsub)) .^2;
end

f                       =   fftshift(f).';
truePSD                 =   fftshift(truePSD).';


%%

if( plotResult          ==  1 )
    figure;
    plot(fftshift(f), 10 * log10(fftshift(truePSD)), 'linewidth', 2); hold on; grid on;
    title(['Signal PSD :: ', mode]);
    xlabel('Frequency (Hz)');
    ylabel('(dBW/Hz)');
    ylim([-110, -50]);
end


end