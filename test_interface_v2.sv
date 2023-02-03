`timescale 1ns / 1ns

interface TS_Intf;
  wire Data;
  logic [7:0] Adrs;
  modport master_mp(input Data, output Adrs);
  modport slave_mp(output Data, input Adrs);
endinterface

module TS_Master (
    TS_Intf.master_mp mi
);
  initial begin
    mi.Adrs = 50;
    #100
    mi.Adrs = 42;
  end
endmodule

module TS_Slave #(
    parameter A = 0
) (
    TS_Intf.slave_mp si,
    input logic data
);
  assign si.Data = (si.Adrs == A) ? data : 1'bz;
endmodule

module Top_Fig2 (
    input logic d42,
    d50
);
  TS_Intf T ();
  TS_Master M (T.master_mp);

  TS_Slave #(50) S50 (
      T.slave_mp,
      d50
  );
  TS_Slave #(42) S42 (
      T.slave_mp,
      d42
  );

endmodule










