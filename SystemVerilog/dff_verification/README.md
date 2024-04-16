# D Flip-Flop Design and Verification using SystemVerilog

## Overview
This project presents the design and verification of a D flip-flop using SystemVerilog. The design includes the implementation of the D flip-flop logic and the verification components such as transaction generator, driver, monitor, scoreboard, environment, and top testbench.

## Files Included
- `design.sv`: SystemVerilog file containing the implementation of the D flip-flop and interface.
- `testbench.sv`: Top-level testbench file for verifying the D flip-flop design.
- `transaction.sv`: Transaction generator module for generating input transactions.
- `driver.sv`: Driver module for driving stimulus to the D flip-flop.
- `monitor.sv`: Monitor module for observing the behavior of the D flip-flop.
- `scoreboard.sv`: Scoreboard module for comparing the expected and actual outputs.
- `environment.sv`: Environment module for configuring and connecting the verification components.
- `README.md`: This README file providing information about the project.

## Instructions for Simulation
1. Ensure that a SystemVerilog-compatible simulator (e.g., ModelSim, VCS) is installed.
2. Compile all SystemVerilog files using the simulator's compilation command.
3. Run the simulation using the compiled testbench module.
4. Analyze the simulation results to verify the functionality of the D flip-flop design.

## Usage
1. Modify the D flip-flop design (`design.sv`) as per your requirements.
2. Customize the testbench (`testbench.sv`) and other verification components to suit your design and testing needs.
3. Run simulations to verify the correctness and functionality of the design.

## Contributors
- [ARAVIND R](https://github.com/aravindar888)