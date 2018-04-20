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


module alt_pr_width_adapter#(
    parameter SINK_DATA_WIDTH     = 16,
    parameter SOURCE_DATA_WIDTH   = 16,
    parameter ENABLE_DATA_PACKING = 1 // Only applicable when it is narrow to wide.
) (
    input  logic                          clk,
    input  logic                          nreset,

    input  logic                          sink_valid,
    input  logic[SINK_DATA_WIDTH - 1:0]   sink_data,
    output logic                          sink_ready,

    output logic                          source_valid,
    output logic[SOURCE_DATA_WIDTH - 1:0] source_data,
    input  logic                          source_ready
);
    generate
        if (SINK_DATA_WIDTH < SOURCE_DATA_WIDTH) begin
            alt_pr_up_converter#(
                .SINK_DATA_WIDTH(SINK_DATA_WIDTH),
                .SOURCE_DATA_WIDTH(SOURCE_DATA_WIDTH),
                .ENABLE_DATA_PACKING(ENABLE_DATA_PACKING)
            ) alt_pr_up_converter (
                .clk(clk),
                .nreset(nreset),

                .sink_valid(sink_valid),
                .sink_data(sink_data),
                .sink_ready(sink_ready),

                .source_valid(source_valid),
                .source_data(source_data),
                .source_ready(source_ready)
            );
        end else if (SINK_DATA_WIDTH > SOURCE_DATA_WIDTH) begin
            alt_pr_down_converter#(
                .SINK_DATA_WIDTH(SINK_DATA_WIDTH),
                .SOURCE_DATA_WIDTH(SOURCE_DATA_WIDTH)
            ) alt_pr_down_converter (
                .clk(clk),
                .nreset(nreset),

                .sink_valid(sink_valid),
                .sink_data(sink_data),
                .sink_ready(sink_ready),

                .source_valid(source_valid),
                .source_data(source_data),
                .source_ready(source_ready)
            );
        end else begin
            assign sink_ready = source_ready;

            assign source_valid = sink_valid;
            assign source_data = sink_data;
        end
    endgenerate
endmodule
