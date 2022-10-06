module grey2bcd(
input [3:0] grey,
output [3:0] bcd
);
assign bcd[3] = grey[3];
assign bcd[2] = grey[3]^grey[2];
assign bcd[1] = grey[3]^grey[2]^grey[1];
assign bcd[0] = grey[3]^grey[2]^grey[1]^grey[0];
endmodule
