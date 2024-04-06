% Medir el tiempo de modulación
tic();
modulador = comm.CPMModulator( ...
    'ModulationOrder',2, ...
    'FrequencyPulse','Gaussian', ...
    'BandwidthTimeProduct',0.5, ...
    'ModulationIndex',1, ...
    'BitInput',true);

%input;
data = [1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1]; %bit stream de ejemplo
%data = data_input;

% modular;
sal = modulador(data.');
modulation_time = toc();

% Visual
figure;
plot(real(sal));
xlabel("Frecuencia");
ylabel("Fase");

disp(['Tiempo de modulación: ' num2str(modulation_time) ' segundos']);
