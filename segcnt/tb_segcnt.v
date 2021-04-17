module tb_segcnt;

reg clk;
reg rst;

reg  en;
wire [6:0] seg0;
wire [6:0] seg1;

initial begin
    rst = 0;
    #300 rst = 1;
end

initial begin
    clk=0;
end

always begin
    #10 clk = ~clk;
end

initial begin
    $dumpfile("0000segcnt.vcd");
    $dumpvars( 1, tb_segcnt.dut );

    #30000 $finish;
end

initial begin
    en = 0;
    #(100*10);
    en = 1;
end

segcnt dut (
    .rst( rst ),
    .clk( clk ),
    .en ( en  ),
    .seg0 ( seg0 ),
    .seg1 ( seg1 )
);


endmodule