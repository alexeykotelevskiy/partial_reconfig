// (C) 2001-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis VERILOG_INPUT_VERSION VERILOG_2001

module alt_pr_cb_interface(
	clk,

	// These interface with an external PR block.
	o_pr_clk_pin,
	o_pr_data_pin,
	pr_done_pin,
	pr_error_pin,
	pr_ready_pin,
	o_pr_request_pin,

	// These PR block signals are to be used in internally.
	pr_clk,
	pr_data,
	o_pr_done,
	o_pr_error,
	o_pr_ready,
	pr_request,

	// This interfaces with an external PR block.
	crc_error_pin,

	// These CRC block signals is to be used in internally.
	o_crc_error
);
	parameter CB_DATA_WIDTH = 16;
	parameter EDCRC_OSC_DIVIDER = 1;
	parameter DEVICE_FAMILY	= "Stratix V";
	parameter INSTANTIATE_PR_BLOCK = 1;
	parameter INSTANTIATE_CRC_BLOCK = 1;

	input clk;

	output o_pr_clk_pin;
	output [CB_DATA_WIDTH-1:0] o_pr_data_pin;
	input  pr_done_pin;
	input  pr_error_pin;
	input  pr_ready_pin;
	output o_pr_request_pin;

	input  pr_clk;
	input  [CB_DATA_WIDTH-1:0] pr_data;
	output o_pr_done;
	output o_pr_error;
	output o_pr_ready;
	input  pr_request;

	input crc_error_pin;

	output o_crc_error;

	assign o_pr_clk_pin = pr_clk;
	assign o_pr_data_pin = pr_data;
	assign o_pr_request_pin = pr_request;

	// -----------------------------------------------------------------------
	// Instantiate wysiwyg for prblock and crcblock according to device family
	// -----------------------------------------------------------------------
	generate
		if (!INSTANTIATE_PR_BLOCK) begin
			assign o_pr_done = pr_done_pin;
			assign o_pr_error = pr_error_pin;
			assign o_pr_ready = pr_ready_pin;
		end
		else if (DEVICE_FAMILY == "Arria 10") begin
			twentynm_prblock m_prblock
			(
				.clk(pr_clk),
				.corectl(1'b1),
				.prrequest(pr_request),
				.data(pr_data),
				.error(o_pr_error),
				.ready(o_pr_ready),
				.done(o_pr_done)
			);
		end
		else if (DEVICE_FAMILY == "Cyclone V") begin
			cyclonev_prblock m_prblock
			(
				.clk(pr_clk),
				.corectl(1'b1),
				.prrequest(pr_request),
				.data(pr_data),
				.error(o_pr_error),
				.ready(o_pr_ready),
				.done(o_pr_done)
			);
		end
		else if (DEVICE_FAMILY == "Arria V") begin
			arriav_prblock m_prblock
			(
				.clk(pr_clk),
				.corectl(1'b1),
				.prrequest(pr_request),
				.data(pr_data),
				.error(o_pr_error),
				.ready(o_pr_ready),
				.done(o_pr_done)
			);
		end
		else if (DEVICE_FAMILY == "Arria V GZ") begin
			arriavgz_prblock m_prblock
			(
				.clk(pr_clk),
				.corectl(1'b1),
				.prrequest(pr_request),
				.data(pr_data),
				.error(o_pr_error),
				.ready(o_pr_ready),
				.done(o_pr_done)
			);
		end
		else begin	// default to Stratix V
			stratixv_prblock m_prblock
			(
				.clk(pr_clk),
				.corectl(1'b1),
				.prrequest(pr_request),
				.data(pr_data),
				.error(o_pr_error),
				.ready(o_pr_ready),
				.done(o_pr_done)
			);
		end
	endgenerate
	
	generate
		if (!INSTANTIATE_CRC_BLOCK) begin
			assign o_crc_error = crc_error_pin;
		end
		else if (DEVICE_FAMILY == "Arria 10") begin
			twentynm_crcblock m_crcblock
			(
				.clk(clk),
				.shiftnld(1'b1),
				.crcerror(o_crc_error)
			);
			defparam m_crcblock.oscillator_divider = EDCRC_OSC_DIVIDER;
		end
		else if (DEVICE_FAMILY == "Cyclone V") begin
			cyclonev_crcblock m_crcblock
			(
				.clk(clk),
				.shiftnld(1'b1),
				.crcerror(o_crc_error)
			);
			defparam m_crcblock.oscillator_divider = EDCRC_OSC_DIVIDER;
		end
		else if (DEVICE_FAMILY == "Arria V") begin
			arriav_crcblock m_crcblock
			(
				.clk(clk),
				.shiftnld(1'b1),
				.crcerror(o_crc_error)
			);
			defparam m_crcblock.oscillator_divider = EDCRC_OSC_DIVIDER;
		end
		else if (DEVICE_FAMILY == "Arria V GZ") begin
			arriavgz_crcblock m_crcblock
			(
				.clk(clk),
				.shiftnld(1'b1),
				.crcerror(o_crc_error)
			);
			defparam m_crcblock.oscillator_divider = EDCRC_OSC_DIVIDER;
		end
		else begin	// default to Stratix V
			stratixv_crcblock m_crcblock
			(
				.clk(clk),
				.shiftnld(1'b1),
				.crcerror(o_crc_error)
			);
			defparam m_crcblock.oscillator_divider = EDCRC_OSC_DIVIDER;
		end
	endgenerate
	
endmodule

