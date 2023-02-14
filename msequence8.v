//20230214
//
//m = x^8 + x^4 + x^3 + 1
//

module msequence8 
    #(parameter seed = 8'b1111_1111)
    (
        clk,
        rst_n,
        en,
        mse8,
        rand8
    );
    input clk,rst_n;
    input en;
    output mse8;
    output reg [7:0] rand8;
    assign mse8 = rand8[0];

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rand8 <= seed;
        else if(en) begin
            rand8[0] <= rand8[1];
            rand8[1] <= rand8[2];
            rand8[2] <= rand8[3];
            rand8[3] <= rand8[4];
            rand8[4] <= rand8[5];
            rand8[5] <= rand8[6];
            rand8[6] <= rand8[7];
            rand8[7] <= rand8[0] ^ rand8[4] ^ rand8[5] ^ rand8[6];

        end
    end

endmodulde
