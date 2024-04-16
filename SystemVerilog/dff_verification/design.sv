module dff(input clk,rst,din,output dout);
reg out;

always @(posedge clk) begin
if(rst ==1)
out <= 0;
else
out <= din;
end
assign dout = out;
endmodule
//..............................................................................................

interface dff_if(input clk);
logic din;
logic rst;
logic dout;
endinterface

//..............................................................................................