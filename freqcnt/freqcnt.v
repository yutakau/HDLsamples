module freqcnt (
    input clk,
    input rst,
    input in,
    output [15:0] fout,
    output        nosignal
);

reg  d1,d2;
wire in_r;
reg  overflowflag;
reg [15:0] freqcnt;
reg [15:0] latch;
reg [15:0] avg1, avg2;


always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        d1 <= 0;
        d2 <= 0;
    end else begin
        d1 <= in;
        d2 <= d1;
    end
end

// edge detect
assign in_r = d1 & ~d2;

// main counter
always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        freqcnt <= 16'b0;
    end else begin
        if (in_r) begin
            freqcnt <= 16'b0;
        end else begin
            freqcnt <= freqcnt + 1'b1;
        end
    end
end

// latch
always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        latch <= 16'b0;
    end else begin
        if (in_r) begin
            latch <= freqcnt;
        end 
    end
end

always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        avg1 <= 16'b0;
        avg2 <= 16'b0;
    end else begin
        if (in_r) begin
            avg1 <= latch;
            avg2 <= avg1;
        end 
    end
end


assign fout = avg2[15:0]; // 


always @(negedge rst or posedge clk)
begin
    if (~rst) begin
        overflowflag <= 1'b0;
    end else begin
        if (in_r) begin
            overflowflag <= 1'b0;
        end else if (freqcnt == 16'hffff) begin
            overflowflag <= 1'b1;
        end 
    end
end

assign nosignal = overflowflag;

endmodule
