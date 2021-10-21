`default_nettype none
`timescale 1ns / 1ps

module draw_line_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset;
    logic clock;

    localparam CORDW = 16;
    logic signed [CORDW-1:0] io_writeX, io_writeY;
    logic signed [CORDW-1:0] io_xs, io_ys, io_xe, io_ye;
    //logic [11:0] io_writeVal;
    logic io_start, io_writeEnable, io_drawing, io_busy, io_done;
    LineDrawing linedrawing_inst (
        .clock,
        .reset,
        .io_start,
        .io_writeEnable,
        .io_xs,
        .io_ys,
        .io_xe,
        .io_ye,
        .io_writeX,
        .io_writeY,
        //.io_writeVal,
        //.drawing,
        //.busy,
        .io_done
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;

    initial begin
        $monitor("\t%d:\t(%d, %d) >%b Done=%b", $time, io_writeX, io_writeY, /*io_writeVal,*/ io_drawing, io_done);
    end

    initial begin
        reset = 1;
        clock = 1;
        #100    reset = 0;
                io_writeEnable = 1;

        #10     $display("case 0: points (0,0) (32,17) (255,255)");
                io_xs = 9'sd0;  // (0,0)
                io_ys = 9'sd0;
                io_xe = 9'sd0;
                io_ye = 9'sd0;
                io_start = 1;
        #10     io_start = 0;

        #100    io_xs = 9'sd32;  // (32,17)
                io_ys = 9'sd17;
                io_xe = 9'sd32;
                io_ye = 9'sd17;
                io_start = 1;
        #10     io_start = 0;

        #100    io_xs = 9'sd255;  // (255,255)
                io_ys = 9'sd255;
                io_xe = 9'sd255;
                io_ye = 9'sd255;
                io_start = 1;
        #10     io_start = 0;

        #100    $display("case 1: (0,1) (6,4) - not steep, down");
                io_xs = 9'sd0;  // left to right
                io_ys = 9'sd1;
                io_xe = 9'sd6;
                io_ye = 9'sd4;
                io_start = 1;
        #10     io_start = 0;

        #100    io_xs = 9'sd6;  // right to left
                io_ys = 9'sd4;
                io_xe = 9'sd0;
                io_ye = 9'sd1;
                io_start = 1;
        #10     io_start = 0;

        #100 $display("case 2: (1,0) (4,6) - steep, down");
                io_xs = 9'sd1;  // left to right
                io_ys = 9'sd0;
                io_xe = 9'sd4;
                io_ye = 9'sd6;
                io_start = 1;
        #10     io_start = 0;


        #100    io_xs = 9'sd4;  // right to left
                io_ys = 9'sd6;
                io_xe = 9'sd1;
                io_ye = 9'sd0;
                io_start = 1;
        #10     io_start = 0;


        #100 $display("case 6: (70,180) (180,50) - longer line");
                io_xs = 9'sd70;
                io_ys = 9'sd180;
                io_xe = 9'sd180;
                io_ye = 9'sd50;
                io_start = 1;
        #10     io_start = 0;

        #2000 $display("case 7: (0,0) (255,0) - horizontal");
                io_xs = 9'sd0;
                io_ys = 9'sd0;
                io_xe = 9'sd255;
                io_ye = 9'sd0;
                io_start = 1;
        #10     io_start = 0;

        #3000 $display("case 8: (0,0) (0,255) - vertical");
                io_xs = 9'sd0;
                io_ys = 9'sd0;
                io_xe = 9'sd0;
                io_ye = 9'sd255;
                io_start = 1;
        #10     io_start = 0;

        #4000   $finish;
    end
    endmodule
