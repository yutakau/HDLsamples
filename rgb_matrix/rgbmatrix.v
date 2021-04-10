
module rgbmatrix ( 
    input clk,
    input rst,
    input [7:0] r,
    input [7:0] g,
    input [7:0] b,
    output [7:0] y,
    output [7:0] cb,
    output [7:0] cr ) ;

reg [15:0] tmpy, tmpcb, tmpcr;
wire [15:0] tmpy1,tmpy2,tmpy3,tmpy4,tmpy5;
wire [15:0] tmpcb1,tmpcb2,tmpcb3,tmpcb4,tmpcb5;
wire [15:0] tmpcr1,tmpcr2,tmpcr3,tmpcr4,tmpcr5;

assign tmpy1 = 46*r;
assign tmpy2 = 157*g;
assign tmpy3 = 15*b + 4096;
assign tmpy4 = tmpy1 + tmpy2;
assign tmpy5 = tmpy4 + tmpy3;

assign tmpcb1 = -25*r;
assign tmpcb2 = -86*g;
assign tmpcb3 = 112*b + 32768;
assign tmpcb4 = tmpcb1+tmpcb2;
assign tmpcb5 = tmpcb3+tmpcb4;

assign tmpcr1 = 112*r;
assign tmpcr2 = -102*g;
assign tmpcr3 = -10*b + 32768;
assign tmpcr4 = tmpcr1+tmpcr2;
assign tmpcr5 = tmpcr3+tmpcr4;

always @(posedge clk or negedge rst) begin
  if (~rst) begin
    tmpy  = 16'h1000;
    tmpcb = 16'h8000;
    tmpcr = 16'h8000;
  end else begin
    tmpy  = tmpy5;    
    tmpcb = tmpcb5;
    tmpcr = tmpcr5;
  end
end

assign y  = tmpy[15:8];
assign cb = tmpcb[15:8];
assign cr = tmpcr[15:8];

//    y  =  (0.183*256)*r + (0.614*256)*g + (0.062*256)*b + (16*256)
//    cb =  (-0.101*256)*r - (0.339*256)*g + (0.439*256)*b + (128*256)
//    cr =  (0.439*256)*r - (0.399*256)*g - (0.040*256)*b + (128*256)

endmodule