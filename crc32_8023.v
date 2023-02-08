module crc32_8023 (
    clk,
    reset,
    d,
    load_init,
    calc,
    d_valid,
    crc_reg,
    crc
);
    input clk;
    input reset;
    input [7:0]d;
    input load_init;
    input calc;
    input d_valid;
    output [31:0] crc_reg;
    output crc;



endmodule
