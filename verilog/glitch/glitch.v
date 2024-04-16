`timescale 1ns/1ps
module glitch_ckt1(y,a,b,c);//for t1>t2
input a,b,c;
output y;
wire n1,n2,n3;
assign #1 n2=a&b;
assign #3 n1=~b;
assign #1 n3=n1&c;
assign #1 y=n2|n3;
endmodule

module glitch_ckt2(y,a,b,c);//for t1=t2
input a,b,c;
output y;
wire n1,n2,n3;
assign #1 n2=a&b;
assign #1 n1=~b;
assign #1 n3=n1&c;
assign #1 y=n2|n3;
endmodule

module glitch_ckt3(y,a,b,c);//for t1<t2
input a,b,c;
output y;
wire n1,n2,n3;
assign #3 n2=a&b;
assign #1 n1=~b;
assign #3 n3=n1&c;
assign #3 y=n2|n3;
endmodule

module glitch_test();
reg a,b,c;
wire y;
//glitch_ckt1 dut1(y,a,b,c);
glitch_ckt2 dut2(y,a,b,c);
//glitch_ckt3 dut3(y,a,b,c);
initial
   begin
   {a,b,c} =3'b111;
   #10
   {a,b,c} =3'b101;
   #10
   {a,b,c} =3'b010;
   #10
   {a,b,c} =3'b000;
   #10
   $stop;
   end
endmodule









