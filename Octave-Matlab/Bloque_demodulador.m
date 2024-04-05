% Parámetros del esquema de modulación GFSK
sampling_rate = 1000000; % Tasa de muestreo en Hz
symbol_rate = 1000; % Tasa de símbolos en baudios
modulation_index = 0.5; % Índice de modulación
frequency_deviation = 5000; % Desviación de frecuencia en Hz

%channel_signal =;

% Medir el tiempo de demodulación
tic();
% Demodulación de la señal GFSK
gfskDemod = comm.CPMDemodulator( ...
    'ModulationOrder',2, ...
    'FrequencyPulse','Gaussian', ...
    'BandwidthTimeProduct',0.5, ...
    'ModulationIndex',1, ...
    'BitOutput',true);

demodulated_bits = gfskDemod(channel_signal);
demodulation_time = toc();

% Visualización de los resultados
figure;

subplot(3, 1, 3);
stem(demodulated_bits);
title('Bits demodulados');
xlabel('Muestras');
ylabel('Valor');

disp(['Tiempo de demodulación: ' num2str(demodulation_time) ' segundos']);