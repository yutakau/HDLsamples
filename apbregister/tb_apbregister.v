module tb_apbregister;

reg rstn;
reg pclk;
reg [15:0] paddr;
reg [15:0] pwdata;
wire [15:0] prdata;
reg   psel;
reg   penable;
reg   pwrite;
wire  pready;
wire [15:0] q0;
wire [15:0] q1;
wire [15:0] q2;

initial begin
    rstn <= 1'b0;
    #50 rstn <= 1'b1;
end

initial begin
    pclk <= 0;
end

always begin
    #50 pclk <= ~pclk;
end

initial begin
    $dumpfile("__apbregister.vcd");
    $dumpvars(1, tb_apbregister);

    #(100*10)  paddr <= 16'h0000;
               pwdata <= 16'haaaa;
               pwrite <= 1;
               psel   <= 1;
               penable <= 0;
    #100       penable <= 1;
    #100       penable <= 0;

    #1000 $finish;
end

apbregister u1 (
    .rstn( rstn ),
    .pclk( pclk ),
    .paddr( paddr ),
    .pwdata( pwdata ),
    .prdata( prdata ),
    .psel  ( psel ),
    .pwrite( pwrite),
    .penable( penable ),
    .pready ( pready ),
    .q0(q0),
    .q1(q1),
    .q2(q2)
);

endmodule