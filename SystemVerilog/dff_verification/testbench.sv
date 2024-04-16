`include "environment.sv"
module testbench;
reg clk;

dff_if vif(clk);
environment env; 
dff dut(vif.clk,vif.rst,vif.din,vif.dout);
initial begin
clk =0;
end

always #5 clk = ~clk;

initial begin
env = new(vif);
env.gen.count= 10;
env.run();
end

endmodule