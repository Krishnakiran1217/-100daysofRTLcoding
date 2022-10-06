module bcd2grey(
input [3:0] bcd,
output [3:0] grey
);

assign grey[0] <= bcd[0];
assign grey[1] <= bcd[0] ^ bcd[1];
assign grey[2] <= bcd[2] ^ bcd[1];
assign grey[3] <= bcd[3] ^ bcd[3];
endmodule
