module ripple_carry_counter(q,clk,reset);

output [3:0] q;
input clk,reset;

T_FF tff0(q[0],clk,reset);
T_FF tff1(q[1],q[0],reset);
T_FF tff2(q[2],q[1],reset);
T_FF tff3(q[3],q[2],reset);

endmodule


module T_FF(q1,clk1,reset1);

output q1;
input clk1,reset1;
wire d1;
D_FF dff0(q1,d1,clk1,reset1);
not n1(d1,q1);

endmodule

module D_FF(q2,d2,clk2,reset2);

output q2;
input d2,clk2,reset2;
reg q2;
always @(posedge reset2 or negedge clk2)
    if(reset2)
        q2<=1'b0;
    else 
        q2<=d2;

endmodule






