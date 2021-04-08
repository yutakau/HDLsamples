module pwm (
   input clk,
   input rst,
   input [7:0]  pwm_width,
   output  pwmout ) ;

reg [7:0] cnt;


assign pwmout = (pwm_width < cnt) ? 1'b1 : 1'b0;

// base counter
always @(posedge clk or negedge rst)
begin
  if (~rst) begin
    cnt = 0;
  end else begin
    cnt = cnt + 1;
  end
end

endmodule
