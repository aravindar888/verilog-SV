
module mux_2x1(f,a,b,r);
input [31:0]a,b;
input r;
output [31:0]f;
assign f = r?b:a;
endmodule

module alu(F,A,B,S0,S1,S2);//main module
input [31:0]A,B;
input S0,S1,S2;
output [31:0] F;
wire [31:0]W1,W2,W3,W4,W5,W6,I0,I1,I2,I3,I4,I5,I6,I7;
assign I0=A+B;
assign I1=A+1;
assign I2=A-B;
assign I3=A-1;
assign I4=A*B;
assign I5=A*B;
assign I6=A*B;
assign I7=A*B;
mux_2x1 m0(.a(I0),.b(I1),.r(S0),.f(W1));
mux_2x1 m1(.a(I2),.b(I3),.r(S0),.f(W2));
mux_2x1 m2(.a(I4),.b(I5),.r(S0),.f(W3));
mux_2x1 m3(.a(I6),.b(I7),.r(S0),.f(W4));
mux_2x1 m4(.a(W1),.b(W2),.r(S1),.f(W5));
mux_2x1 m5(.a(W3),.b(W4),.r(S1),.f(W6));
mux_2x1 m6(.a(W5),.b(W6),.r(S2),.f(F));
endmodule

module testalu1();
reg [31:0] A,B;
reg S0,S1,S2;
wire [31:0] F;
alu dut(F,A,B,S0,S1,S2);  
initial
  begin
  A = 32'h86;//134 in decimal
  B = 32'h78;//120 in decimal
  {S2,S1,S0} =3'b000;//A+B=254
  #40
  {S2,S1,S0} =3'b001;//A+1=135
  #40
  {S2,S1,S0} =3'b010;//A-B=14
  #40
  {S2,S1,S0} =3'b011;//A-1=133
  #40
  {S2,S1,S0} =3'b100;//A*B=16080
  #40
  {S2,S1,S0} =3'b101;//A*B=16080
  #40
  {S2,S1,S0} =3'b110;//A*B=16080
  #40
  {S2,S1,S0} =3'b111;//A*B=16080
  #40
  $stop;
  end
endmodule