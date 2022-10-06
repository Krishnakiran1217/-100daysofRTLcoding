
module async_fifo #(
parameter DATA_WIDTH=32,
parameter ADDR_WIDTH=4)
(
input rclk;
input wclk;
input rstn;
input rd_en;
input wr_en;
input  [ DATA_WIDTH-1 : 0 ] data_in;
output [ DATA_WIDTH-1 : 0 ] data_out;
output empty;
output full;
);
parameter DEPTH =1<<ADDR_WIDTH;
reg  [ADDR_WIDTH-1 : 0] wr_ptr, wr_ptr_sync;
reg  [ADDR_WIDTH-1 : 0] rd_ptr, rd_ptr_sync;

always@(posedge rclk or negedge rstn)
begin
	if (rstn==0)begin
		rd_ptr<=0;
	end
	else if (rd_en) begin
		rd_ptr<=rd_ptr+1;
	end
end
always@(posedge wrclk or negedge rstn)
begin
	if (rstn==0)begin
		wr_ptr<=0;
	end
	else if (wr_en) begin
		wr_ptr<= wr_ptr+1;
	end
end
wire 
//bcd to greycode converter
bcd2grey b2g_wr_ptr(
.grey(),
.bcd()
);
//2d syncers for rd_ptr

//2d syncer for wr_ptr

//greycode to bcd converter
grey2bcd g2b_wr_ptr(
.grey(),
.bcd()
);

dualmem #(
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
) (
.wr_en(),
.rd_en(),
.wr_addr(),
.rd_addr(),
.datain(),
.dataout()
);


endmodule
