// reconf.v

// Generated using ACDS version 16.0 211

`timescale 1 ps / 1 ps
module reconf (
		input  wire        clk,            //            clk.clk
		input  wire        nreset,         //         nreset.reset_n
		input  wire        pr_start,       //       pr_start.pr_start
		input  wire        double_pr,      //      double_pr.double_pr
		output wire        freeze,         //         freeze.freeze
		output wire [2:0]  status,         //         status.status
		input  wire        pr_ready_pin,   //   pr_ready_pin.pr_ready_pin
		input  wire        pr_done_pin,    //    pr_done_pin.pr_done_pin
		input  wire        pr_error_pin,   //   pr_error_pin.pr_error_pin
		input  wire        crc_error_pin,  //  crc_error_pin.crc_error_pin
		output wire        pr_request_pin, // pr_request_pin.pr_request_pin
		output wire        pr_clk_pin,     //     pr_clk_pin.pr_clk_pin
		output wire [15:0] pr_data_pin,    //    pr_data_pin.pr_data_pin
		input  wire [15:0] data,           //      avst_sink.data
		input  wire        data_valid,     //               .valid
		output wire        data_ready      //               .ready
	);

	alt_pr #(
		.PR_INTERNAL_HOST              (0),
		.ENABLE_JTAG                   (1),
		.ENABLE_AVMM_SLAVE             (0),
		.ENABLE_INTERRUPT              (0),
		.ENABLE_PRPOF_ID_CHECK         (0),
		.EXT_HOST_PRPOF_ID             (0),
		.EXT_HOST_TARGET_DEVICE_FAMILY ("Cyclone V"),
		.DATA_WIDTH_INDEX              (16),
		.CB_DATA_WIDTH                 (16),
		.ENABLE_DATA_PACKING           (1),
		.CDRATIO                       (1),
		.EDCRC_OSC_DIVIDER             (1),
		.ENABLE_ENHANCED_DECOMPRESSION (0),
		.INSTANTIATE_PR_BLOCK          (1),
		.INSTANTIATE_CRC_BLOCK         (1),
		.DEVICE_FAMILY                 ("Cyclone V")
	) reconf_inst (
		.clk                    (clk),                  //            clk.clk
		.nreset                 (nreset),               //         nreset.reset_n
		.pr_start               (pr_start),             //       pr_start.pr_start
		.double_pr              (double_pr),            //      double_pr.double_pr
		.freeze                 (freeze),               //         freeze.freeze
		.status                 (status),               //         status.status
		.pr_ready_pin           (pr_ready_pin),         //   pr_ready_pin.pr_ready_pin
		.pr_done_pin            (pr_done_pin),          //    pr_done_pin.pr_done_pin
		.pr_error_pin           (pr_error_pin),         //   pr_error_pin.pr_error_pin
		.crc_error_pin          (crc_error_pin),        //  crc_error_pin.crc_error_pin
		.pr_request_pin         (pr_request_pin),       // pr_request_pin.pr_request_pin
		.pr_clk_pin             (pr_clk_pin),           //     pr_clk_pin.pr_clk_pin
		.pr_data_pin            (pr_data_pin),          //    pr_data_pin.pr_data_pin
		.data                   (data),                 //      avst_sink.data
		.data_valid             (data_valid),           //               .valid
		.data_ready             (data_ready),           //               .ready
		.avmm_slave_address     (1'b0),                 //    (terminated)
		.avmm_slave_read        (1'b0),                 //    (terminated)
		.avmm_slave_writedata   (16'b0000000000000000), //    (terminated)
		.avmm_slave_write       (1'b0),                 //    (terminated)
		.avmm_slave_readdata    (),                     //    (terminated)
		.avmm_slave_waitrequest (),                     //    (terminated)
		.irq                    ()                      //    (terminated)
	);

endmodule
