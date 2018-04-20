module freeze_region(
	input clk,
	input freeze,
	input dir,
	output [3:0] leds
);

reg dir_int;
led_wrapper led_wrapper_int(
	.clk(clk),
	.dir(dir_int),
	.leds(leds)
);


always @(posedge clk)
begin
	dir_int <= freeze ? 1'b1 : dir;
end


endmodule