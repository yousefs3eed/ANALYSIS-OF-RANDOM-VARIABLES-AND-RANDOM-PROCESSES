% Set the desired range
min_value = -3;
max_value = 5;

% Generate uniformly distributed data
data = unifrnd(min_value, max_value, [1, 100000]); % Adjust the number of samples as needed

% Display the results
disp(data);