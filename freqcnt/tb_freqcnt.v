module tb_freqcnt;

reg clk;
reg rst;
wire in;
wire [15:0] fout;
wire        nosignal;
reg freq1;
reg freq2;
reg simcnt;

initial begin
    rst <= 0;
    #50 rst <= 1;
end

initial begin
    clk <= 0;
    freq1 <= 0;
    freq2 <= 0;
    simcnt = 0;
end


always begin
    #50 clk <= ~clk;
end

initial begin
    $dumpfile("sim_freqcnt.vcd");
    $dumpvars(2, tb_freqcnt);
    #60000 $finish;
end

always begin
    #50 clk <= ~clk;
end

always begin
    #600 freq1 <= ~freq1;
end

always begin
    #2000 freq2 <= ~freq2;
end

initial begin
    simcnt = 0;
    #9000 simcnt = 1;
end

assign in = (simcnt == 0) ? freq1 : freq2;

freqcnt u1 (
    .clk(clk),
    .rst(rst),
    .in(in),
    .fout(fout),
    .nosignal(nosignal)
);

endmodule