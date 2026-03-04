`timescale 1ns / 1ps

module tb;

    reg clk, rst_n, stop;
    wire [7:0] uo_out;
    wire[3:0] count = uo_out[3:0];
    wire win = uo_out[4];

    tt_um_alexijustine_stop_the_clock test_bench (
        .ui_in({7'b0, stop}),   // stop on bit 0
        .uo_out(uo_out),
        .uio_in(8'b0),
        .uio_out(),
        .uio_oe(),
        .ena(1'b1),
        .clk(clk),
        .rst_n(rst_n)
    );

    // 10ns clock period 5 up/down 
    always #5 clk = ~clk;

    initial begin 
        clk = 0; stop = 0; rst_n = 1;
        #3; 
        rst_n = 0;  // reset values

        // **************** lose test ******************************************************
        // goal is 10, stops at 5
        #100        // count starts around here
        stop = 0;
        #40
        stop = 1;
        #15
        stop = 0;

        if (count == 4'd5 && win == 0)
            $display("Lose Test: PASS - correctly stopped at %0d", count);
        else
            $display("Lose Test: FAIL - expected stop at 5 and win is 0, actual stop at %0d and win is %0d", count, win);

        // ****************** win test ******************************************************
        // reset values
        rst_n = 1;
        #15
        rst_n = 0;

        // stops at target value, 10 clocks
        #90;
        stop = 1;
        #15;
        stop = 0;       // releasing button

        if (count == 4'd10 && win == 1)
            $display("Win Test: PASS - win = 1 and count = %0d", count);
        else
            $display("Win Test: FAIL - expected count = 10 and win = 1, actual count = %0d win = %0d", count, win);

        // ******************************* Test that STOP successfully stopped counter ***************************
        #50
        if (count == 4'd10)
            $display("Stop Test: PASS - counter held at %0d after stop", count);
        else
            $display("Stop Test: FAIL - counter kept running after stop, count=%0d", count);

        // ********************************** Test reset worked ***************************************
        rst_n = 1;
        #15;
        rst_n = 0;
        if (count == 4'd0 && win == 0)
            $display("Reset Test: PASS - count = %0d and win = %0d", count, win);
        else
            $display("Reset Test: FAIL - count=%0d win=%0d", count, win);
        
        #50;
        $finish;
    end

endmodule
