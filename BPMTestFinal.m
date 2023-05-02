%Max Goodrich 11/27/2022 Final Program for recording BPM 
clear; clc;

%arduino variables
bpmArduino = arduino();
monitorPin = 'A0';
ledPin = 'D13';

%everything else
voltageArray = [];
beatArray = [];
BPMArray = [];
time = tic;
%variables that you can change if you are so inclined
waitTime = 0.01;
thresholdVoltage = 2.8;

tic %starts tic. Not sure why the variable doesn't do that because it worked before but didn't work when i booted up MATLAB again to test
while true
    %reads the voltage given by the sensor
    monitorVoltage = readVoltage(bpmArduino, monitorPin);
    voltageArray(length(voltageArray) + 1) = monitorVoltage;
    
        if voltageArray(length(voltageArray)) >= thresholdVoltage && voltageArray(length(voltageArray) - 1) < thresholdVoltage
            %regiter that a beat has happened and a certain time
            beatArray(length(beatArray) + 1) = toc;
            %blinks led to show if shit is working
            writeDigitalPin(bpmArduino, ledPin, 1);
            pause(waitTime);
            writeDigitalPin(bpmArduino, ledPin, 0);
            %starts to display BPM with enough data
            if length(beatArray) > 1
                %subtracts the 2 time readings
                beatTime = beatArray(length(beatArray)) - beatArray(length(beatArray) - 1);
                %because you have 1 beat / x seconds you divide by those
                %seconds to get x beats per 1 second and then multiply by
                %60 to get BPM
                BPM = 60 / beatTime;
                disp(BPM);
                %stores bpm as an array for later use
                BPMArray(length(BPMArray) + 1) = BPM;
            end
        end
    %pause so that you aren't taking a reading every milionth of a second
    pause(waitTime);
end