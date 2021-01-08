%
% =====================
% === LMS ALGORITHM ===
% =====================
%
% Function that iterates the LMS algorithm.
%
% INPUTS
%%% d:  vector with reference signal.
%%% x:  vector with input signal.
%%% P:  number of coefficients of the filter to be estimated (must be even).
%%% mu: convergence coefficient (non-normalized).
%
% OUTPUTS
%%% H:  Matrix with filter coefficients for each time instant.
%%%       * Rows      -> coefficients.
%%%       * Columns   -> time.
%%% y:  Vector with adaptive filter output as a function of time.
%%% e:  Vector with error signal as a function of time.
%


function [H, y, e] = algoritmeLMS(d, x, P, mu)
  iterations = P:length(x);
  H=zeros(P, length(x)-P+1);
  first = -min(iterations);
  for k=1:1
  for j=iterations
    index=first+j+1;
    xn= x(j-P+1:j);
    y(index) = H(:, index)'*xn;
    e(index)=d(j)-y(index);
    H(:, index+1)=H(:, index)+mu*xn*conj(e(index));
  end
  H(:, 1) = H(:, first+max(iterations));
  end
end