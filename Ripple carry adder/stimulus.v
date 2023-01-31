`timescale 1ns / 1ns
`include "design.v"
module stimulus;

reg clk;
reg reset;
wire [3:0] q;

ripple_carry_counter r1(q,clk,reset);
// $dumpfile("stimulus_tb.vcd");
// $dumpvars(0,stimulus_tb);

initial 
    clk=1'b0;
always
    #5 clk = ~clk;

initial 
begin
    reset =1'b1;
    #15 reset =1'b0;
    #180 reset =1'b1;
    #10 reset =1'b0;
    #20 $finish;
end

initial 
    $monitor($time," Output q = %d",q);

endmodule