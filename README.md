# MATLAB-Pulse-Sensor
---
## BPM Test Final:

  This MATLAB script is meant to connect to an arduino and the 'Pulse Sensor' module and an LED. The user needs to specify the analog pin connected to the pulse sensor and the digital pin connected to the LED to start this program. There is also a thresholdVoltage variable which can be changed depending on the data collected from the voltage calibration script (more on that later). When the program is run, the BPM is displayed in the MATLAB command window and the LED will blink in line with the pulse.
  
  ---
  ## Voltage Calibration Plotter
   
   This MATALB script is a supplemental script that can be used to calibrate the voltage threshold in the main script. The user needs to specify the analog pin and run the script for a certain amount of time. Then they can plot the voltageArray vs. timeArray. The user can then select a voltage that is below the large peaks but above the smaller ones to use in the main program. 
