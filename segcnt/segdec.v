module segdec (
    input  [3:0] val,
    output [6:0] seg
);


function [6:0] dec;
    input [3:0] in;

    case (in)
      4'b0000 : dec = 7'b0111111;
      4'b0001 : dec = 7'b0000110;
      4'b0010 : dec = 7'b0111111;
      4'b0011 : dec = 7'b1011011;
      4'b0100 : dec = 7'b1100110;
      4'b0101 : dec = 7'b0101011;
      4'b0110 : dec = 7'b1111101;
      4'b0111 : dec = 7'b0000111;
      4'b1000 : dec = 7'b1111111;
      4'b1001 : dec = 7'b1101111;
      default : dec = 7'b0000000;
    endcase
endfunction

assign seg = dec(val);

endmodule