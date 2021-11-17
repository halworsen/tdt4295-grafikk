`default_nettype none
`timescale 1ns / 1ps

module normalize_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset, io_aresetn;
    logic clock;

    localparam CORDW = 16;

    logic [CORDW-1:0] io_pixel_x, io_pixel_y
    logic signed [CORDW-1:0] io_point_x, io_point_y, io_point_z, io_point_w;
    Normalizer normalize_inst (
        .clock,
        .reset,
        .point,
        .pixel,
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;

    initial begin
        $monitor("Point: \t(x: %d, y: %d, z: %d, w: %d)", io_point_x, io_point_y, io_point_z, io_point_w);
    end

    initial begin
        io_aresetn = 0;
        reset = 1;
        clock = 1;
        #100    reset = 0;
                io_aresetn = 1;
                io_writeEnable = 1;

        #10     $display("case 0: normalize point (0.0, 0.0, 0.0, 1.0)");
                io_point_x = 9'sd0;
                io_point_y = 9'sd0;
                io_point_z = 9'sd0;
                io_point_w = 9'sd1;

        #100    io_pixel_x = 9'sd320;
                io_pixel_y = 9'sd240;

        #4000   $finish;
    end

    initial begin
        $monitor("Pixel: \t(x: %d, y: %d)", io_pixel_x, io_pixel_y);
    end
endmodule
