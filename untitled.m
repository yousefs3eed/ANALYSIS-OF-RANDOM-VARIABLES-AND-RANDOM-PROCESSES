% Load data from .mat file
filename = 'data3.mat'; % Replace with your .mat file name
data = load(filename);
data = struct2cell(data); % Convert data to cell array

% Extract data from cell array
data = data{1};

% Calculate the mean
mean_value = sum(data) / numel(data);

% Calculate the variance
sum_squared_diff = sum((data - mean_value).^2);
variance_value = sum_squared_diff / numel(data);

% Calculate the third moment
sum_cubed_diff = sum((data - mean_value).^3);
third_moment = sum_cubed_diff / numel(data);+++++

% Display the results
fprintf('Mean: %.2f\n', mean_value);
fprintf('Variance: %.2f\n', variance_value);
fprintf('Third Moment: %.2f\n', third_moment);

% Calculate Moment Generating Function (MGF) M(t) versus 0 < t < 2
t_values = linspace(0, 2, 100); % Define t values
M_t = exp(mean_value * t_values + (variance_value * t_values.^2) / 2); % Calculate MGF

% Plot MGF M(t) versus 0 < t < 2
figure;
plot(t_values, M_t);
title('Moment Generating Function (MGF) M(t)');
xlabel('t');
ylabel('M(t)');
grid on;

% Calculate the first derivative of M(t) and its value at t = 0
first_derivative_M_t = diff(M_t) ./ diff(t_values);
first_derivative_at_t_0 = first_derivative_M_t(1);

% Calculate the second derivative of M(t) and its value at t = 0
second_derivative_M_t = diff(first_derivative_M_t) ./ diff(t_values(1:end-1));
second_derivative_at_t_0 = second_derivative_M_t(1);

% Display the values of derivatives at t = 0
fprintf('First Derivative at t = 0: %.2f\n', first_derivative_at_t_0);
fprintf('Second Derivative at t = 0: %.2f\n', second_derivative_at_t_0);

% Plot the first derivative of M(t)
figure;
plot(t_values(1:end-1), first_derivative_M_t);
title('First Derivative of M(t)');
xlabel('t');
ylabel('dM(t)/dt');
grid on;

% Plot the second derivative of M(t)
figure;
plot(t_values(1:end-2), second_derivative_M_t);
title('Second Derivative of M(t)');
xlabel('t');
ylabel('d^2M(t)/dt^2');
grid on;
