`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2026 02:08:07 PM
// Design Name: 
// Module Name: lfsr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// LFSR Random Number Generator

module lfsr(
    input clk_i,
    input reset_i,
    output [7:0] q_o 
    );

wire [7:0] internal_q_w;

assign x1 = (internal_q_w[0] & ~internal_q_w[5]) | (~internal_q_w[0] & internal_q_w[5]);
assign x2 = (internal_q_w[6] & ~internal_q_w[7]) | (~internal_q_w[6] & internal_q_w[7]); 
assign y = (x1 & ~x2) | (~x1 & x2);

FDRE #(.INIT(1'b0) ) ff_0 (
    .C(clk_i),      // Clock
    .R(reset_i),       // reset == 0
    .CE(1'b1),      // Clock Enable on
    .D(y),     
    .Q(internal_q_w[0])
    );
FDRE #(.INIT(1'b0) ) ff_1(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[0]),     
    .Q(internal_q_w[1])
    );
FDRE #(.INIT(1'b0) ) ff_2(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[1]),     
    .Q(internal_q_w[2])
    );
FDRE #(.INIT(1'b0) ) ff_3(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[2]),     
    .Q(internal_q_w[3])
    );
FDRE #(.INIT(1'b0) ) ff_4(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[3]),     
    .Q(internal_q_w[4])
    );
FDRE #(.INIT(1'b0) ) ff_5(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[4]),     
    .Q(internal_q_w[5])
    );
FDRE #(.INIT(1'b0) ) ff_6(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[5]),     
    .Q(internal_q_w[6])
    );
FDRE #(.INIT(1'b1) ) ff_7(
    .C(clk_i),  // Clock
    .R(reset_i),        // reset == 0
    .CE(1'b1),  // Clock Enable on
    .D(internal_q_w[6]),     
    .Q(internal_q_w[7])
    );
    
assign q_o = internal_q_w;

endmodule
