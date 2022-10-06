module syncr_2d #(
parameter DATA_WIDTH=8;
)
(
input clk;
input  [DATA_WIDTH-1:0] d;
output reg [DATA_WIDTH-1:0] q;
);
reg [DATA_WIDTH-1:0] dd;


always@(posedge clk)begin
	dd<=d;
	q<=dd;
end
endmodule
