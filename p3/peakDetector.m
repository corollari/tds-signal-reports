%
% ==========================================
% ===            PEAK DETECTOR           ===
% === Sergi Locubiche Serra (PhD) :: UAB ===
% ==========================================
%
% Inputs
% -> input      ::  data segment (vector) to be analysed.
% -> numPeaks   ::  number of peaks to look for.
%
% Outputs
% -> peaks_x    ::  vector with location of peaks.
% -> peaks_y    ::  vector with value of peaks.
%


function [peaks_x, peaks_y]             =   peakDetector( input, numPeaks )


%% Local parameter definition and memory allocation.

numPoints                               =   length(input);
voidPoints                              =   floor(0.75 * numPoints * 0.005);
peaks_x                                 =   zeros(1, numPeaks);
peaks_y                                 =   zeros(1, numPeaks);


%% Detect peaks.

for k                                   =   1 : numPeaks
    
    % Detect value and position of maximum peak.
    peaks_x(k)                          =   find(input == max(input));
    peaks_y(k)                          =   input(peaks_x(k));
    
    % Set index to void points around maximum peak.
    voidIdx                             =   (peaks_x(k) - voidPoints) : (peaks_x(k) + voidPoints);
    
    % Saturate index so as not to point out of the array.
    voidIdx(voidIdx < 1)                =   [];
    voidIdx(voidIdx > numPoints)        =   [];
    
    % Void points around maximum peak.
    input(voidIdx)                      =   0;
    
end


end