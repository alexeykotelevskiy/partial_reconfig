module top(
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "AF14" *) input clk,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "AB12" *) input dir,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "V18, V17, W16, V16" *)	output [3:0] leds,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "AH28, AG28, AF28, AG27, AE28, AE27, AE26" *) output [6:0] HEX,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "Y16" *) input nreset

);

wire freeze_wire;

wire error_bridge;
wire ready_bridge;
wire error_pr_bridge;
wire done_bridge;
wire request_bridge;
wire [15:0] data_bridge;
wire corectl_bridge = 1;
wire clk_w;


hex_view hex_view_inst(
	.clk(clk),
	.HEX(HEX)
);


cyclonev_prblock cyclonev_prblock_inst(
	.clk(clk_w),
	.ready(ready_bridge),
	.error(error_pr_bridge),
	.done(done_bridge),
	.prrequest(request_bridge),
	.data(data_bridge),
	.corectl(corectl_bridge) 
);


cyclonev_crcblock cyclonev_crcblock_inst(
	.clk(clk_w),
	.shiftnld(1),
	.crcerror(error_bridge)
);
				


reconfig reconfig_inst(
	.clk(clk),
	.nreset(nreset),
	.freeze(freeze_wire),
	//ее.data_ready(0),
	.crc_error_pin(error_bridge),
	.pr_ready_pin(ready_bridge),
	.pr_error_pin(error_pr_bridge),
	.pr_done_pin(done_bridge),
	.pr_request_pin(request_bridge),
	.pr_data_pin(data_bridge),
	.pr_clk_pin(clk_w)
	
);


freeze_region freeze_region_inst(
	.clk(clk),
	.dir(dir),
	.leds(leds),
	.freeze(freeze_wire)
);



endmodule