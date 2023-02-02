//2023-02-02 02:01:17
//just test interface
interface Sig_Intf;
    logic Sig;
    modport driver_mp(output Sig);
    modport reciver_mp(input Sig);
endinterface


module Driver(Sig_Intf.driver_mp si);
    initial si.Sig = 1'b1;
endmodule


module Reciver(Sig_Intf.reciver_mp ri);
    initial  $display(ri.Sig);
endmodule

module Top_Fig1;
    Sig_Intf S();
    Driver D(S.driver_mp);
    Reciver R(S.reciver_mp);
endmodule
