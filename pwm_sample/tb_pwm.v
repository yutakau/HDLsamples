module tb_pwm;

reg clk;
reg rst;
reg [7:0]  pwm_width;
wire  pwmout;


initial begin
  clk=0;
end

initial begin
  rst=0;
  #25 rst=1;
end

always #10 clk = ~clk;

initial begin
  $dumpfile("dump_pwm0.vcd");
  $dumpvars(1, tb_pwm.u1);

  #(60000*3) $finish;

end

initial begin
  pwm_width = 8'h80;
  #60000 pwm_width = 8'h20;
  #60000 pwm_width = 8'hC0;
  #60000 ;
end

pwm u1 (
    .clk       ( clk ),
    .rst       ( rst ),
    .pwm_width ( pwm_width ),
    .pwmout    ( pwmout )
);

endmodule