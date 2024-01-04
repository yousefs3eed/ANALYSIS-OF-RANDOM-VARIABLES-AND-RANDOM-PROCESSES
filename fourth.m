% User input for the number of sample functions (M) and index (n)
fprintf('Enter the number of sample functions to plot: ');
M = input('');
fprintf('Enter the index of the sample function for specific analyses: ');
n = input('');

% Load data manually (simulate loaded_data)
file_name = 'Sample_Process_2023 (1).mat';  % Replace with the correct file name

% Simulating loaded data (amplitude and time)
loaded_data = load(file_name);
amplitude = loaded_data.X;  % Assuming 'X' contains amplitude values
time = loaded_data.t;  % Assuming 't' contains corresponding time values

% Plot M sample functions of the ensemble
figure;
for i = 1:M
    plot(time, amplitude(i, :));
    hold on;
end
hold off;
xlabel('Time');
ylabel('Amplitude');
title(sprintf('Plot of %d Sample Functions of Stochastic Process', M));

% Calculate and plot the ensemble mean of the process
ensemble_mean = zeros(1, length(time));
for i = 1:M
    ensemble_mean = ensemble_mean + amplitude(i, :);
end
ensemble_mean = ensemble_mean / M;

figure;
plot(time, ensemble_mean);
xlabel('Time');
ylabel('Ensemble Mean');
title('Ensemble Mean of Stochastic Process');

% Calculate and plot the statistical auto-correlation function
statistical_acf = zeros(1, length(ensemble_mean)*2 - 1);
for k = 1:length(ensemble_mean)
    for j = 1:length(ensemble_mean)
        statistical_acf(k+j-1) = statistical_acf(k+j-1) + ensemble_mean(k) * ensemble_mean(j);
    end
end
lags = -length(ensemble_mean) + 1 : length(ensemble_mean) - 1;
figure;
plot(lags, statistical_acf);
xlabel('Lag');
ylabel('Statistical Auto-correlation Function');
title('Statistical Auto-correlation Function of Stochastic Process');

% Calculate the time mean of the n-th sample function of the process
nth_sample_time_mean = sum(amplitude(n, :)) / length(amplitude(n, :));
fprintf('Time mean of %dth sample function: %f\n', n, nth_sample_time_mean);

% Calculate the time auto-correlation function of the n-th sample function
nth_sample_auto_corr = zeros(1, length(amplitude(n, :))*2 - 1);
for k = 1:length(amplitude(n, :))
    for j = 1:length(amplitude(n, :))
        nth_sample_auto_corr(k+j-1) = nth_sample_auto_corr(k+j-1) + amplitude(n, k) * amplitude(n, j);
    end
end
figure;
plot(-length(amplitude(n, :)) + 1 : length(amplitude(n, :)) - 1, nth_sample_auto_corr);
xlabel('Lag');
ylabel('Auto-correlation');
title(sprintf('Auto-correlation of %dth Sample Function', n));

% Calculate and plot the power spectral density of the process
Fs = 1 / (time(2) - time(1)); % Sampling frequency
figure;
for i = 1:M
    Pxx = zeros(1, length(amplitude(i, :)));
    for k = 1:length(amplitude(i, :))
        Pxx(k) = amplitude(i, k) * amplitude(i, k);
    end
    F = (0:length(amplitude(i, :))-1) * Fs / length(amplitude(i, :));
    plot(F, 10*log10(Pxx));
    hold on;
end
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Power Spectral Density of Stochastic Process');
hold off;

% Calculating the total average power of the process
total_power = 0;
for i = 1:size(amplitude, 1)
    for k = 1:length(amplitude(i, :))
        total_power = total_power + amplitude(i, k) * amplitude(i, k);
    end
end

total_avg_power = total_power / (size(amplitude, 1) * length(amplitude(1, :)));
fprintf('Total average power of the process: %f\n', total_avg_power);
