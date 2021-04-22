module sif
(
    input wire clk,
    input wire rst,

    input wire en,
    input wire [7:0] data,
    
    output reg sck,
    output reg sdat,
    output reg sen
);

reg   en_d, en_dd;
reg [3:0] cnt;
wire en_rise;
reg  sen_p;
reg  sck_p;
reg  sdat_p;


always @(negedge rst or posedge clk )
begin
    if (~rst) begin
        en_d <= 1'b0;
        en_dd <= 1'b0;
    end
    else begin
        en_d <= en;
        en_dd <= en_d;
    end
end

assign en_rise = en_d & ~en_dd;   // rising edge detect

always @(negedge rst or posedge clk )
begin
    if (~rst) begin
        cnt <= 4'b0000;
        sen_p <= 1'b0;
        sck_p <= 1'b0;
    end 
    else begin
        if (en_rise && ~sen_p) begin
            sen_p <= 1'b1;
            sck_p <= 1'b0;
        end
        else if (cnt == 4'b1111) begin
            sen_p <= 1'b0;
            cnt <= cnt;
            sck_p <= 1'b0;
        end
        else if (sen_p) begin
            cnt <= cnt + 1'b1;
            sck_p <= ~sck_p;
        end
    end   
end


always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        sdat_p <= 1'b0;
    end
    else begin
        case (cnt[3:1] )
            3'b000 : sdat_p <= data[0];
            3'b001 : sdat_p <= data[1];
            3'b010 : sdat_p <= data[2];
            3'b011 : sdat_p <= data[3];
            3'b100 : sdat_p <= data[4];
            3'b101 : sdat_p <= data[5];
            3'b110 : sdat_p <= data[6];
            default : sdat_p <= data[7];
        endcase
    end
end

always @(negedge rst or posedge clk )
begin
    if (~rst) begin
        sen  <= 1'b0;
        sck  <= 1'b0;
        sdat <= 1'b0;
    end
    else begin
        sen  <= sen_p;        
        sck  <= sck_p;
        sdat <= sdat_p; 
    end
end

endmodule