% Parámetros del esquema de modulación GFSK
sampling_rate = 1000000; % Tasa de muestreo en Hz
symbol_rate = 1000; % Tasa de símbolos en baudios
modulation_index = 0.5; % Índice de modulación
frequency_deviation = 5000; % Desviación de frecuencia en Hz

% Señal recibida
%%%%%received_signal = % Aquí proporcionar la señal recibida

% Iniciar el temporizador
tic();

% Filtro de demodulación GFSK (filtro paso de banda)
b = gaussdesign(modulation_index, symbol_rate, sampling_rate); % Diseño del filtro gaussiano
received_signal_filtered = conv(received_signal, b, 'same'); % Filtrar la señal recibida

% Detener el temporizador y obtener el tiempo de ejecución
elapsed_time = toc();

% Demodulación de la señal GFSK
demodulated_signal = diff(received_signal_filtered); % Diferenciación para detectar cambios de fase

% Umbral para determinar bits
threshold = mean(demodulated_signal); % Umbral para determinar bits
demodulated_bits = demodulated_signal > threshold; % Determinar bits según el umbral

% Mostrar resultados
figure;
plot(demodulated_bits);
title('Bits demodulados');

% Mostrar el tiempo de ejecución
disp(['Tiempo de ejecución del bloque demodulador: ' num2str(elapsed_time) ' segundos']);

% Aquí continuar procesando los bits demodulados