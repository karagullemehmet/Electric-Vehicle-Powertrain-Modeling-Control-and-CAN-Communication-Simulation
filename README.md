# Electric Vehicle Powertrain Modeling, Control and CAN Communication Simulation

This project presents a **MATLAB/Simulink-based electric vehicle powertrain model** including **longitudinal dynamics**, **control system implementation**, and **CAN communication simulation** for ECU signal exchange.

---

## 🔧 Project Structure
| File | Description |
|------|--------------|
| `EV_Powertrain.slx` | Simulink model of the electric vehicle powertrain and CAN communication blocks |
| `Graph.m` | MATLAB script for plotting simulation results (speed, torque, power, etc.) |
| `Electric Vehicle Powertrain Modeling.docx` | Technical report explaining system modeling, parameters, and test results |
| `README.md` | Project description file |

---

## 🚗 Key Features
- Longitudinal dynamics modeled with **F = m·a** approach  
- Includes **motor torque generation**, **aerodynamic drag**, and **rolling resistance**  
- Integrated **CAN communication layer** for data exchange between subsystems  
- **PID-based control** tuning for torque and speed loops  
- Post-processing in MATLAB for result visualization

---

## 🧰 Tools & Toolboxes
- MATLAB R2023b  
- Simulink  
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


