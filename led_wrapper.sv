module led_wrapper
(
	input clk,
	input dir,
	output [3:0] leds
);
	led_flash led_flash_inst(
		.clk(clk),
		.dir(dir),
		.leds(leds)
	);
	

endmodule