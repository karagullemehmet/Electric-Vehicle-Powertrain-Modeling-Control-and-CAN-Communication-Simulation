# Electric Vehicle Powertrain Modeling, Control, and CAN Communication Simulation

This project presents a **MATLAB/Simulink-based electric vehicle powertrain model** incorporating longitudinal dynamics, control system design, and CAN communication for ECU signal exchange.

## 🔧 Project Structure
| File | Description |
|------|--------------|
| **EV_Powertrain.slx** | Simulink model including vehicle dynamics, torque control, and CAN network blocks |
| **Graph.m** | MATLAB script for post-processing and visualization (speed, torque, power, etc.) |
| **Technical_Report.pdf** | Detailed documentation of modeling approach, parameters, and simulation results |
| **README.md** | Project description and execution guide |

## 🚗 Key Features
- Longitudinal vehicle dynamics modeled using **Newton’s Second Law (F = m·a)**  
- Includes **motor torque generation**, aerodynamic drag, and rolling resistance  
- Integrated **CAN communication** for subsystem data exchange  
- **PID-based speed and torque control loops**  
- Post-processing in MATLAB for result visualization  

## 🧰 Tools & Toolboxes
- MATLAB R2023a  
- Simulink  
- Vehicle Dynamics Blockset  
- Vehicle Network Toolbox  
- Simulink Control Design  

## 📊 Simulation Outputs
Key results include:
- Vehicle speed–time and torque–response plots  
- Power flow of motor and battery  
- CAN bus transmitted and received signal visualization  

To reproduce results, open *EV_Powertrain.slx* and run **Graph.m** after simulation.

- Vehicle Dynamics Blockset  
- Vehicle Network Toolbox  
- Simulink Control Design  

---

## 📊 Simulation Outputs
Example simulation results include:
- Vehicle speed vs. time  
- Torque response curves  
- Battery and motor power flow  
- CAN bus transmitted signals  

*(To view results, run `Graph.m` after the simulation.)*


