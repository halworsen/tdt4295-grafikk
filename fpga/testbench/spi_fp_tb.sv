`default_nettype none
`timescale 1ns / 1ps

module spi_fp_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz
    parameter SPI_CLK_PERIOD = 500;

    logic reset;
    logic clock;

    localparam CORDW = 16;
    logic [3:0] io_btn;
    logic io_aresetn, io_led;
    logic io_spi_mosi, io_spi_miso, io_spi_cs, io_spi_sclk;
    Main main (
        .clock,
        .reset,
        .io_aresetn,
        .io_btn,
        .io_led,
        .io_spi_mosi,
        .io_spi_miso,
        .io_spi_sclk,
        .io_spi_cs
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;
    always #(SPI_CLK_PERIOD / 2) io_spi_sclk = ~io_spi_sclk;

    //initial begin
        //$monitor("\t%d:\t(%d, %d) >%b Done=%b", $time, io_writeX, io_writeY, [>io_writeVal,<] io_drawing, io_done);
    //end

    initial begin
        reset = 1;
        io_aresetn = 0;
        clock = 1;
        io_spi_cs = 1;

        #100    reset = 0;
                io_aresetn = 1;
                io_spi_sclk = 0;
                io_spi_cs = 0;
                io_spi_mosi = 1; // OPS: First bit sent

        #10     $display("case 0: (-0.5,-0.5) - (0.5, -0.5) - (0.5,0.5) - (-0.5, 0.5)");
        // Point 1
        // x
        //#500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // y
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // z
        #500    io_spi_mosi = 0;
        #7500
        // w
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // Point 2

        // x
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // y
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1; // BP
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        // z
        #500    io_spi_mosi = 0;
        #7500
        // w
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // point 3
        // x
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // y
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        // z
        #500    io_spi_mosi = 0;
        #7500
        // w
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // Point 4
        // x
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        // y
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        // z
        #500    io_spi_mosi = 0;
        #7500
        // w
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        // Lines
        // 500 cycles * 4 lines * 2 points * 16bits + 100 for cs

        #64500
        #100    io_spi_cs = 1;


        #500   $finish;
    end
    endmodule
