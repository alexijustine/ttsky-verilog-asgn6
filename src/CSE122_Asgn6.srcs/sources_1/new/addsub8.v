`timescale 1ns / 1ps

module addSub8(
    input [3:0] A,
    input [3:0] B,
    input sub,
    output [3:0] S
    );
    
    wire [3:0] B_mod; 
    wire cout;
    
    assign B_mod = B ^ {4{sub}};
    
    fulladder4 addition(
        .a(A),
        .b(B_mod),
        .cin(sub),
        .s(S),
        .cout(cout)
    );

endmodule