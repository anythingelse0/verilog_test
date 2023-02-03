`timescale 1ns / 1ns

interface TS_Intf;
  logic Data;
  logic slave_D[0:1];
  logic [7:0] Adrs;
  modport master_mp(input Data, output Adrs);
  modport slave_mp(output slave_D, input Adrs);
  always_comb begin
      Data = slave_D[0] | slave_D[1];
  end
endinterface

module TS_Master (
    TS_Intf.master_mp mi
);
  initial begin
    mi.Adrs = 50;
    /* verilator lint_off STMTDLY */
    #100
    mi.Adrs = 42;
  end
endmodule

module TS_Slave #(
    parameter A = 0,slave_ID=0
) (
    TS_Intf.slave_mp si,
    input logic data
);
always_comb begin
    if(si.Adrs == A)
        si.slave_D[slave_ID] = data;
    else
        si.slave_D[slave_ID] = 0;
end
endmodule

module Top_Fig2 (
    input logic d42,
    d50
);
  TS_Intf T ();
  TS_Master M (T.master_mp);

  TS_Slave #(50,0) S50 (
      T.slave_mp,
      d50
  );
  TS_Slave #(42,1) S42 (
      T.slave_mp,
      d42
  );

endmodule










