// BCD counter with 7 segment decorder
//
//

module segcnt (
    input rst,
    input clk,
    input en,
    output [6:0] seg0,
    output [6:0] seg1
);

reg [3:0] cnt0, cnt1;

always @(rst or clk) begin
    if (~rst) begin
        cnt0 <= 0;
    end 
    else if (en) begin
        if (cnt0 == 4'b1001)
            cnt0 <= 0;
        else
            cnt0 <= cnt0 + 1;
    end
end

always @(rst or clk) begin
    if (~rst) begin
        cnt1 <= 0;
    end 
    else if ((en == 1'b1) && (cnt0 == 4'b1001))  begin
        cnt1 <= cnt1 + 1;
    end
end

segdec u0 (
    .val( cnt0 ),
    .seg( seg0 )
);

segdec u1 (
    .val( cnt1 ),
    .seg( seg1 )
);



endmodule