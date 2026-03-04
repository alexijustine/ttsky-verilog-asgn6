`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2026 01:12:37 PM
// Design Name: 
// Module Name: top_level
// Project Name: stop the clock
// Target Devices: 
// Tool Versions: 
// Description: values count up, if player presses stop at the designated time, the player wins.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_level(
    input clk_i,
    input reset_i,
    input stop_i,       // player button
    output [3:0] count_o,
    output win_o
);

wire up_w;
// wire [3:0] q_w;
wire stopped_w;

// latch for stop button
FDRE ff_stop (
    .C(clk_i),
    .R(reset_i),
    .CE(1'b1),        // captures on button press
    .D(stopped_w | stop_i),           // once stopped, stays stopped
    .Q(stopped_w)
);

assign up_w = ~stopped_w;  // count up until stop is pressed.

counter4 start_count (
    .clk_i(clk_i),
    .up_i(up_w),
    .dw_i(1'b0),    // taken from cse100, down not needed
    .ld_i(1'b0),    
    .din_i(4'b0000),    // starts at 0
    .reset_i(reset_i),
    .q_o(count_o),
    .utc_o(),        
    .dtc_o()      
);

// win if player stops at 10
assign win_o = stopped_w & (count_o == 4'd10);

endmodule
