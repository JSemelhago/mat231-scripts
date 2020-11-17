# mat231-seirmodel

Project B in MAT231 to generate an SEIR model for Covid-19 in Canada. 

Repository includes MATLAB code, applet, and Python code.



### MATLAB Code

Code to produce SEIR plot using `ode45` differential solver in MATLAB.

Run `SEIRgraph.m` to produce the plot.

### MATLAB Applet

Code to produce a MATLAB applet which uses MATLAB App Designer. The plotting code is the same as what's under **MATLAB Code**. 

Encourages the user to perform a sensitivity analysis by allowing adjustment of initial values. 

Run `seirgui/for_redistribution_files_only/SEIR_GUI_Canada.exe` for applet as shown below or run `seirgui.mlapp` if MATLAB is installed (newer than 2017b):



![MATLAB Applet](seir_applet.png?raw=true)



### Python Code

Code to solve system of ODEs numerically using Euler's method through Jupyter Notebook. The code creates `seir_eulersdata.csv` and is then plotted using `seaborn`:



![Python Eulers](seir_eulers.png?raw=true)
