module ledsample (
    input rst,
    input clk,
    output [7:0] q
);


reg [7:0] cnt;
wire [3:0] deg;
reg [7:0] val;
reg [7:0] tmp;
reg [7:0] tmp1;

// main counter
always @(negedge rst or posedge clk )
begin
    if (~rst) begin
        cnt <= 8'b0;
    end else begin
        cnt <= cnt + 1'b1;
    end
end

assign deg = cnt[7:4];

// sin table
always @( * ) begin
    case (deg)
        4'b0000: val = 8'h00;
        4'b0001: val = 8'h35;
        4'b0010: val = 8'h68;
        4'b0011: val = 8'h96;
        4'b0100: val = 8'hbe;
        4'b0101: val = 8'hdd;
        4'b0110: val = 8'hf3;
        4'b0111: val = 8'hfe;
        4'b1000: val = 8'hfe;
        4'b1001: val = 8'hf3;
        4'b1010: val = 8'hdd;
        4'b1011: val = 8'hbe;
        4'b1100: val = 8'h96;
        4'b1101: val = 8'h68;
        4'b1110: val = 8'h35;
        default: val = 8'h00;
    endcase
end

// decoder
always @(*) begin
    case (val[7:4])
        4'b0000: tmp = 8'b00000001;
        4'b0001: tmp = 8'b00000010;
        4'b0010: tmp = 8'b00000100;
        4'b0011: tmp = 8'b00001000;
        4'b0100: tmp = 8'b00010000;
        4'b0101: tmp = 8'b00100000;
        4'b0110: tmp = 8'b01000000;
        4'b0111: tmp = 8'b10000000;
        4'b1000: tmp = 8'b01000000;
        4'b1001: tmp = 8'b00100000;
        4'b1010: tmp = 8'b00010000;
        4'b1011: tmp = 8'b00001000;
        4'b1100: tmp = 8'b00000100;
        4'b1101: tmp = 8'b00000010;
        4'b1110: tmp = 8'b00000001;
        default: tmp = 8'b00000001;
    endcase
end

//

always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        tmp1 <= 8'b0;
    end
    else begin
        tmp1 <= tmp;
    end
end

assign q = tmp1;

endmodule