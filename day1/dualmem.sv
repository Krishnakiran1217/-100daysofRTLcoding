module dualmem #(
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=4;
)
(
input [DATA_WIDTH-1:0] datain;
input [DATA_WIDTH-1:0]wr_addr;
input [DATA_WIDTH-1:0]rd_addr;
output [DATA_WIDTH-1:0] dataout;
input wr_en;
input rd_en;
);
parameter DEPTH =1<<ADDR_WIDTH;
[DATA_WIDTH-1:0]mem[0:DEPTH-1];

assign dataout = rd_en ? mem[rd_rddr] : 'h0;
assign mem[wr_addr] = wr_en? data_in :mem[wr_addr];
endmodule
