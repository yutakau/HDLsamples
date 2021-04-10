module tb_rgbmatrix;

reg clk;
reg rst;

reg [7:0] r;
reg [7:0] g;
reg [7:0] b;

wire [7:0] y;
wire [7:0] cb;
wire [7:0] cr;

initial begin
    clk=0;
end

initial begin
    rst=0;
    #25 rst=1;
end

always #10 clk = ~clk;

initial begin
    $dumpfile("dump_rgb.vcd");
    $dumpvars(1, tb_rgbmatrix.u1);

    #3000 $finish;
end

initial begin
r=8'h00;
g=8'h00;
b=8'h00;
#500
r=8'hF0;
g=8'hF0;
b=8'hF0;
#500
r=8'h88;
g=8'h55;
b=8'h33;
end

rgbmatrix u1 (
    .rst(rst),
    .clk(clk),
    .r(r),
    .g(g),
    .b(b),
    .y(y),
    .cb(cb),
    .cr(cr) );

endmodule