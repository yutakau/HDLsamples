module apbregister 
 (
    input rstn,
    input pclk,
    input [15:0] paddr,
    input [15:0] pwdata,
    output [15:0] prdata,
    input   psel,
    input   pwrite,
    input penable,
    output pready,
    output [15:0] q0,
    output [15:0] q1,
    output [15:0] q2
 );

reg [15:0] reg0;
reg [15:0] reg1;
reg [15:0] reg2;

always @(negedge rstn or posedge pclk) begin
    if ( ~rstn ) begin
        reg0 <= 16'b0;
    end
    else begin
        if ( (paddr[7:0] == 8'b00000000) && psel && penable && pwrite  ) begin
            reg0 <= pwdata;
        end
    end
end

always @(negedge rstn or posedge pclk) begin
    if ( ~rstn ) begin
        reg1 <= 16'b0;
    end
    else begin
        if ( (paddr[7:0] == 8'b00000001) && psel && penable && pwrite  ) begin
            reg1 <= pwdata;
        end
    end
end

always @(negedge rstn or posedge pclk) begin
    if ( ~rstn ) begin
        reg2 <= 16'b0;
    end
    else begin
        if ( (paddr[7:0] == 8'b00000010) && psel && penable && pwrite  ) begin
            reg2 <= pwdata;
        end
    end
end

assign prdata = (paddr[7:0] == 8'b00000000) ? reg0 :
                (paddr[7:0] == 8'b00000001) ? reg1 :
                (paddr[7:0] == 8'b00000010) ? reg2 : 16'b0;

assign pready = penable & psel;
assign q0 = reg0;
assign q1 = reg1;
assign q2 = reg2;



endmodule

