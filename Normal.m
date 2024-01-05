% Parameters for the normal distribution
mu = -8;     % Mean
sigma = 4 ;   % Standard deviation (square root of variance, which is 4)

% Generate normally distributed data
Y = normrnd(mu, sigma, [1, 1000000]);

% Display or save the data as needed
disp(Y);