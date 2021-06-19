module rotenc (
    input clk,
    input rst,
    input a,
    input b,    
    output [7:0] cnt
);

reg  a_d,a_dd;
reg  b_d,b_dd;
reg [7:0] cnt_q;


always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        a_d  <= 0;
        a_dd <= 0;
    end else begin
        a_d  <= a;
        a_dd <= a_d;
    end
end

always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        b_d  <= 0;
        b_dd <= 0;
    end else begin
        b_d  <= b;
        b_dd <= b_d;
    end
end


// main counter
always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        cnt_q <= 8'b10000000;
    end else begin
        if ( b_d & ~b_dd) begin   // rise of b
            if (a) begin
                cnt_q <= cnt_q + 1;
            end
            else begin
                cnt_q <= cnt_q - 1;
            end

        end
    end
end

assign cnt = cnt_q;


endmodule
