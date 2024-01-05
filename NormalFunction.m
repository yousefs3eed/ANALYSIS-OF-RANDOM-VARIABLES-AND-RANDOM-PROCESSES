% Parameters for the random process
t = linspace(0, 2, 1000); % Time vector from 0 to 2
num_samples = 10000; % Number of sample functions to generate

% Preallocating matrix for amplitude values
X = zeros(num_samples, length(t));

% Generate sample functions
for i = 1:num_samples
    % Generate normally distributed random values for amplitude
    % Mean = 0, Standard Deviation = 1
    amplitude = randn(1, length(t));

    % Scale the amplitude values to the range between -5 and 5
    amplitude = 5 * amplitude / max(abs(amplitude)); % Scale to [-5, 5]
    
    X(i, :) = amplitude .* cos(4 * pi * t); % Generating the random process
end

% Save the variables X and t to a .mat file
save('Z_process_data_normal_scaled.mat', 'X', 't');
