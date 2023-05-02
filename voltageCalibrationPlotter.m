%Max Goodrich 11/27/2022 Voltage Calibration Plotting Thing (I should come up with a more elegant name)
clear; clc;

%create arduino object and specify pin used
bpmArduino = arduino();
monitorPin = 'A0';

%variables
voltageArray = [];
timeArray = [];
time = tic;
waitTime = 0.1;

tic
%start a loop that records the voltage and time to compare on a plot
while true

    monitorVoltage = readVoltage(bpmArduino, monitorPin);

    timeArray(length(timeArray) + 1) = toc; 
    voltageArray(length(voltageArray) + 1) = monitorVoltage;

    pause(waitTime);
end
