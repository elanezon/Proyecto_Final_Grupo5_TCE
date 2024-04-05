modulador = comm.CPMModulator( ...
    'ModulationOrder',2, ...
    'FrequencyPulse','Gaussian', ...
    'BandwidthTimeProduct',0.5, ...
    'ModulationIndex',12, ...
    'BitInput',true);

%input;
data = [1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1]; %bit stream de ejemplo
%data = data_input;

% modular;
sal = modulador(data');

% Visual
figure;
plot(real(sal));
xlabel("Frecuencia");
ylabel("Fase");
