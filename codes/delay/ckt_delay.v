`timescale 1ns/1ps
module ckt_delay1(A,B,C,F);
input A,B,C;
output F;
wire D,E;
not #(1:2:3) n1(D,A);
and #(2:3:4) g1(E,D,B);
xor #(4:5:6) x1(F,E,C);
endmodule

module ckt_delay2(A,B,C,F);
input A,B,C;
output F;
wire D,E;
not n1(D,A);
and #(3:5:7) g1(E,D,B);
xor #(5:7:9) x1(F,E,C);
endmodule

module sim_delay();
reg A,B,C;
wire F;
ckt_delay1 dut1 (A,B,C,F);
//ckt_delay2 dut2 (A,B,C,F);
initial
   begin
     A=1'b0; B=1'b0; C=1'b0;
     #10
     A=1'b0; B=1'b1; C=1'b0;
     #10
     A =1'b1; B=1'b1; C=1'b1;
     #20
     $stop;
    end
endmodule
