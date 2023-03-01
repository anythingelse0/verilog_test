/* verilator lint_off DECLFILENAME */
module tb ();


    logic clk,rst_n;
    logic en;
    logic mse8;
    logic [7:0] rand8;

    wire __unused_op = &{1'b0,rand8,mse8,1'b0};

msequence8
dut (.*);

always begin
    #10
clk <=~ clk ;  
end

assign en = 1;
assign #100 rst_n = 1; 

initial begin
    $dumpvars;
    $dumpon;
    #10000
    $dumpoff;
    $finish;
end

 initial   $dumpfile("tb.vcd");
endmodule
