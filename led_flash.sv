module led_flash
(
	input clk,
	input dir,
	output reg [3:0] leds
);

initial
begin
	leds = 4'b0001;
end

reg [31:0] count = 0;

always @(posedge clk)
begin
	if (count >= 25000000)
	begin 
		if (leds == 4'b1000)
			leds <= 4'b0001;
		else
			leds <= leds << 1;
		count <= 0;
	end
	else
		count <= count + 1;
	
end



endmodule