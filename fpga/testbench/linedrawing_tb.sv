`default_nettype none
`timescale 1ns / 1ps

module draw_line_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset;
    logic clock;

    localparam CORDW = 16;
    logic signed [CORDW-1:0] writeX, writeY;
    logic signed [CORDW-1:0] xs, ys, xe, ye;
    logic [11:0] writeVal;
    logic start, writeEnable, drawing, busy, done;
    LineDrawing linedrawing_inst (
        .clock,
        .reset,
        .start,
        .writeEnable,
        .xs,
        .ys,
        .xe,
        .ye,
        .writeX,
        .writeY,
        .writeVal,
        //.drawing,
        //.busy,
        .done
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;

    initial begin
        $monitor("\t%d:\t(%d, %d) >%b Done=%b", $time, writeX, writeY, writeVal, drawing, done);
    end

    initial begin
        reset = 1;
        clock = 1;
        #100    reset = 0;
                writeEnable = 1;

        #10     $display("case 0: points (0,0) (32,17) (255,255)");
                xs = 9'sd0;  // (0,0)
                ys = 9'sd0;
                xe = 9'sd0;
                ye = 9'sd0;
                start = 1;
        #10     start = 0;

        #100    xs = 9'sd32;  // (32,17)
                ys = 9'sd17;
                xe = 9'sd32;
                ye = 9'sd17;
                start = 1;
        #10     start = 0;

        #100    xs = 9'sd255;  // (255,255)
                ys = 9'sd255;
                xe = 9'sd255;
                ye = 9'sd255;
                start = 1;
        #10     start = 0;

        #100    $display("case 1: (0,1) (6,4) - not steep, down");
                xs = 9'sd0;  // left to right
                ys = 9'sd1;
                xe = 9'sd6;
                ye = 9'sd4;
                start = 1;
        #10     start = 0;

        #100    xs = 9'sd6;  // right to left
                ys = 9'sd4;
                xe = 9'sd0;
                ye = 9'sd1;
                start = 1;
        #10     start = 0;

        #100 $display("case 2: (1,0) (4,6) - steep, down");
                xs = 9'sd1;  // left to right
                ys = 9'sd0;
                xe = 9'sd4;
                ye = 9'sd6;
                start = 1;
        #10     start = 0;


        #100    xs = 9'sd4;  // right to left
                ys = 9'sd6;
                xe = 9'sd1;
                ye = 9'sd0;
                start = 1;
        #10     start = 0;


        #100 $display("case 6: (70,180) (180,50) - longer line");
                xs = 9'sd70;
                ys = 9'sd180;
                xe = 9'sd180;
                ye = 9'sd50;
                start = 1;
        #10     start = 0;

        #2000 $display("case 7: (0,0) (255,0) - horizontal");
                xs = 9'sd0;
                ys = 9'sd0;
                xe = 9'sd255;
                ye = 9'sd0;
                start = 1;
        #10     start = 0;

        #3000 $display("case 8: (0,0) (0,255) - vertical");
                xs = 9'sd0;
                ys = 9'sd0;
                xe = 9'sd0;
                ye = 9'sd255;
                start = 1;
        #10     start = 0;

        #4000   $finish;
    end
    endmodule
