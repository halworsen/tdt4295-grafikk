`default_nettype none
`timescale 1ns / 1ps

module main_spi_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz
    parameter SPI_CLK_PERIOD = 500;

    logic reset;
    logic clock;

    localparam CORDW = 16;
    logic io_aresetn, io_btn, io_led;
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
        io_spi_sclk = 0;

        #100    reset = 0;
                io_aresetn = 1;

        #10     $display("case 0: ");
                io_spi_mosi = 0;
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
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
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
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 1;
        #500    io_spi_mosi = 0;
        #500    io_spi_mosi = 0;

        #500    io_spi_mosi = 0;

        #4000   $finish;
    end
    endmodule
