`default_nettype none
`timescale 1ns / 1ps

module clear_buffer_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset;
    logic clock;

    localparam width = 640;
    localparam height = 480;
    localparam colorDepth = 4;
    logic signed [12-1:0] writeX, writeY;
    logic [12:0] readX, readY;
    logic [11:0] readVal, writeVal;
    logic readClock; // TODO: wtf??
    logic writeEnable, readEnable, clearBuffer;
    FrameBuffer framebuffer_inst (
        .clock,
        .reset,
        .writeEnable,
	.readEnable,
        .readX,
	.readY,
        .writeX,
        .writeY,
        .writeVal,
	.readVal,
        //.drawing,
        //.busy,
	.clearBuffer
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;

    initial begin
        $monitor("\t%d:\t(%d, %d) >%b Clear Buffer=%b", $time, writeX, writeY, writeVal, writeEnable, clearBuffer);
    end

    initial begin
        reset = 1;
        clock = 1;
        #100    reset = 0;
                writeEnable = 1;

        #10     $display("case 0: Fill in (1,1) with 1.S, then clear, and display (0,0)");
		writeX = 1;
		writeY = 1;

		clearBuffer = 1;

		readEnable = 1;

		readX = 1;
		readY = 1;

		$display("X = %d, Y = %d, Value = %d", readX, readY, readVal);

	#4000   $finish;
    end
endmodule
