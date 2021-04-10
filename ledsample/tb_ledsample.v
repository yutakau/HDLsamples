module tb_ledsample;

reg clk;
reg rst;

wire [7:0] q;

initial begin
    rst <= 0;
    #200 rst <= 1;
end


initial begin
    clk <= 0;
end

always #20 clk <= ~clk;


initial begin
    $dumpfile("ledsample.vcd");
    $dumpvars(1, tb_ledsample.u1 );
    #10000 $finish;
end

ledsample u1 (
    .rst(rst),
    .clk(clk),
    .q(q)
);

endmodule