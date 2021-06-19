module tb_rotenc;

reg clk;
reg rst;
wire in;
wire [7:0] cnt;
reg [7:0] simcnt;
reg a,b;

initial begin
    rst <= 0;
    #50 rst <= 1;
end

initial begin
    clk <= 0;
    a  <= 0;
    b  <= 0;
    simcnt = 0;
end



always begin
    #50 clk <= ~clk;
end

initial begin
    $dumpfile("sim_rotenc.vcd");
    $dumpvars(2, tb_rotenc);
    #60000 $finish;
end

always begin
    #50 clk <= ~clk;
end


initial begin
    simcnt = 0;
    #100 simcnt = simcnt + 1;
end

always begin
    #200  a = 0; b=0;
    #200  a = 0; b=1;
    #200  a = 1; b=1;
    #200  a = 1; b=0;

    #100
    #200  a = 0; b=0;
    #200  a = 0; b=1;
    #200  a = 1; b=1;
    #200  a = 1; b=0;

    #100
    #200  a = 0; b=0;
    #200  a = 0; b=0;
    #200  a = 1; b=0;
    #200  a = 1; b=1;
    #200  a = 0; b=1;

    #500
    $finish;

end




rotenc u1 (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .cnt(cnt)
);

endmodule