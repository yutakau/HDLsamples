module tb_sif;

reg rst;
reg clk;

reg en;
reg [7:0] data;
wire sck;
wire sdat;
wire sen;

initial begin
    rst <= 0;
    clk <= 0;
    #200 rst <= 1;
end

always begin
    #100 clk <= ~clk;
end

initial begin
    en <= 1'b0;
    data <= 8'hCC;

    #405
    en <= 1'b1;

    #5000 $finish;
end

initial begin
    $dumpfile("____sif.vcd");
    $dumpvars(1, tb_sif.u0);
end


sif u0 (
    .clk(clk),
    .rst(rst),

    .en (en ),
    .data( data ),
    
    .sck (sck ),
    .sdat(sdat),
    .sen (sen)
);


endmodule