module hex_view(
	input clk,
	output reg [6:0] HEX

);
reg [4:0] num=0;
reg [6:0] ss_arr [15:0];
reg [31:0] count = 0;
initial begin
	ss_arr[0]  = 7'h40; // 0
	ss_arr[1]  = 7'h79; // 1
	ss_arr[2]  = 7'h24; // 2
	ss_arr[3]  = 7'h30; // 3
	ss_arr[4]  = 7'h19; // 4
	ss_arr[5]  = 7'h12; // 5
	ss_arr[6]  = 7'h02; // 6
	ss_arr[7]  = 7'h78; // 7
	ss_arr[8]  = 7'h00; // 8
	ss_arr[9]  = 7'h10; // 9
	ss_arr[10] = 7'h08; // A
	ss_arr[11] = 7'h03; // B
	ss_arr[12] = 7'h46; // C
	ss_arr[13] = 7'h21; // D
	ss_arr[14] = 7'h06; // E
	ss_arr[15] = 7'h0e; // F
	
end






always @(posedge clk)
begin
	if (count >= 50000000)
	begin
		if (num == 15) begin
			num=0;
			end
		else begin
			num=num+1;
			end
			HEX = ss_arr[num];
		count <= 0;		
	end
	else
		count <= count + 1; 
end


endmodule