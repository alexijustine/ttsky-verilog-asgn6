module FDRE #(parameter INIT = 1'b0) (
    input  C,
    input  R,
    input  CE,
    input  D,
    output reg Q
);
    initial Q = INIT;
    always @(posedge C)
        if (R)      Q <= 1'b0;
        else if (CE) Q <= D;
endmodule
