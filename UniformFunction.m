% Parameters for the random process
t = linspace(0, 2, 1000); % Time vector from 0 to 2
num_samples = 10000; % Number of sample functions to generate

% Preallocating matrix for amplitude values
X = zeros(num_samples, length(t));

% Generate sample functions
for i = 1:num_samples
    theta = unifrnd(0, pi); % Random theta uniformly distributed between 0 and pi
    X(i, :) = cos(4 * pi * t + theta);
end

% Save the variables X and t to a .mat file
save('Z_process_data.mat', 'X', 't');