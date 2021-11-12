`default_nettype none
`timescale 1ns / 1ps

module matrix_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset, io_aresetn;
    logic clock;

    localparam CORDW = 16;
    logic [7:0] io_vec4_0, io_vec4_1, io_vec4_2, io_vec4_3, io_mat4_0_0, io_mat4_0_1, io_mat4_0_2, io_mat4_0_3, io_mat4_1_0, io_mat4_1_1, io_mat4_1_2, io_mat4_1_3, io_mat4_2_0, io_mat4_2_1, io_mat4_2_2, io_mat4_2_3, io_mat4_3_0, io_mat4_3_1, io_mat4_3_2, io_mat4_3_3, io_outVec4_0, io_outVec4_1, io_outVec4_2, io_outVec4_3;

    //logic [11:0] io_writeVal;
    MVP mvp_inst (
        .clock,
        .reset,
        .io_vec4_0,
        .io_vec4_1,
        .io_vec4_2,
        .io_vec4_3,
        .io_mat4_0_0,
        .io_mat4_0_1,
        .io_mat4_0_2,
        .io_mat4_0_3,
        .io_mat4_1_0,
        .io_mat4_1_1,
        .io_mat4_1_2,
        .io_mat4_1_3,
        .io_mat4_2_0,
        .io_mat4_2_1,
        .io_mat4_2_2,
        .io_mat4_2_3,
        .io_mat4_3_0,
        .io_mat4_3_1,
        .io_mat4_3_2,
        .io_mat4_3_3,
        .io_outVec4_0,
        .io_outVec4_1,
        .io_outVec4_2,
        .io_outVec4_3
    );

    // generate clock
    always #(CLK_PERIOD / 2) clock = ~clock;

    //initial begin
        //$monitor("\t%d:\t(%d, %d) >%b Done=%b", $time);
    //end

    initial begin
        io_aresetn = 0;
        reset = 1;
        clock = 1;
        #100    reset = 0;
                io_aresetn = 1;

        #10     $display("case 0: all 1 vec: [0.5, 0.5, 0.5, 0.5] x all 0.5 mat: [[0.5, 0.5, 0.5, 0.5]...]");
                io_vec4_0   = 8'b01;
                io_vec4_1   = 8'b01;
                io_vec4_2   = 8'b01;
                io_vec4_3   = 8'b01;
                io_mat4_0_0 = 8'b01;
                io_mat4_0_1 = 8'b01;
                io_mat4_0_2 = 8'b01;
                io_mat4_0_3 = 8'b01;
                io_mat4_1_0 = 8'b01;
                io_mat4_1_1 = 8'b01;
                io_mat4_1_2 = 8'b01;
                io_mat4_1_3 = 8'b01;
                io_mat4_2_0 = 8'b01;
                io_mat4_2_1 = 8'b01;
                io_mat4_2_2 = 8'b01;
                io_mat4_2_3 = 8'b01;
                io_mat4_3_0 = 8'b01;
                io_mat4_3_1 = 8'b01;
                io_mat4_3_2 = 8'b01;
                io_mat4_3_3 = 8'b01;

        #10     $display("case 1: vec: [0.5, 0.75, 0.875, 0.9375] x 1111, 0.5 0.5 0.5 0.5 ... mat: [[1, 1, 1, 1]...]");
                io_vec4_0   = 8'b01;
                io_vec4_1   = 8'b011;
                io_vec4_2   = 8'b0111;
                io_vec4_3   = 8'b01111;
                io_mat4_0_0 = 8'b1;
                io_mat4_0_1 = 8'b01;
                io_mat4_0_2 = 8'b001;
                io_mat4_0_3 = 8'b0001;
                io_mat4_1_0 = 8'b1;
                io_mat4_1_1 = 8'b01;
                io_mat4_1_2 = 8'b001;
                io_mat4_1_3 = 8'b0001;
                io_mat4_2_0 = 8'b1;
                io_mat4_2_1 = 8'b01;
                io_mat4_2_2 = 8'b001;
                io_mat4_2_3 = 8'b0001;
                io_mat4_3_0 = 8'b1;
                io_mat4_3_1 = 8'b01;
                io_mat4_3_2 = 8'b001;
                io_mat4_3_3 = 8'b0001;

        #500   $finish;
    end
    endmodule
