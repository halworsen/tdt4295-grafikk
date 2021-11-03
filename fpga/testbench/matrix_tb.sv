`default_nettype none
`timescale 1ns / 1ps

module matrix_tb ();

    parameter CLK_PERIOD = 10;  // 10 ns == 100 MHz

    logic reset, io_aresetn;
    logic clock;

    localparam CORDW = 16;
    logic [31:0] io_vec4_0, io_vec4_1, io_vec4_2, io_vec4_3, io_mat4_0_0, io_mat4_0_1, io_mat4_0_2, io_mat4_0_3, io_mat4_1_0, io_mat4_1_1, io_mat4_1_2, io_mat4_1_3, io_mat4_2_0, io_mat4_2_1, io_mat4_2_2, io_mat4_2_3, io_mat4_3_0, io_mat4_3_1, io_mat4_3_2, io_mat4_3_3, io_outVec4_0, io_outVec4_1, io_outVec4_2, io_outVec4_3;

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

        #10     $display("case 0: all 1 vec: [1, 1, 1, 1] x all 1 mat: [[1, 1, 1, 1]...]");
                io_vec4_0   = 32'sd1;
                io_vec4_1   = 32'sd1;
                io_vec4_2   = 32'sd1;
                io_vec4_3   = 32'sd1;
                io_mat4_0_0 = 32'sd1;
                io_mat4_0_1 = 32'sd1;
                io_mat4_0_2 = 32'sd1;
                io_mat4_0_3 = 32'sd1;
                io_mat4_1_0 = 32'sd1;
                io_mat4_1_1 = 32'sd1;
                io_mat4_1_2 = 32'sd1;
                io_mat4_1_3 = 32'sd1;
                io_mat4_2_0 = 32'sd1;
                io_mat4_2_1 = 32'sd1;
                io_mat4_2_2 = 32'sd1;
                io_mat4_2_3 = 32'sd1;
                io_mat4_3_0 = 32'sd1;
                io_mat4_3_1 = 32'sd1;
                io_mat4_3_2 = 32'sd1;
                io_mat4_3_3 = 32'sd1;

        #10     $display("case 1: vec: [1, 2, 3, 4] x 1111, 2222... mat: [[1, 1, 1, 1]...]");
                io_vec4_0   = 32'sd1;
                io_vec4_1   = 32'sd2;
                io_vec4_2   = 32'sd3;
                io_vec4_3   = 32'sd4;
                io_mat4_0_0 = 32'sd1;
                io_mat4_0_1 = 32'sd2;
                io_mat4_0_2 = 32'sd3;
                io_mat4_0_3 = 32'sd4;
                io_mat4_1_0 = 32'sd1;
                io_mat4_1_1 = 32'sd2;
                io_mat4_1_2 = 32'sd3;
                io_mat4_1_3 = 32'sd4;
                io_mat4_2_0 = 32'sd1;
                io_mat4_2_1 = 32'sd2;
                io_mat4_2_2 = 32'sd3;
                io_mat4_2_3 = 32'sd4;
                io_mat4_3_0 = 32'sd1;
                io_mat4_3_1 = 32'sd2;
                io_mat4_3_2 = 32'sd3;
                io_mat4_3_3 = 32'sd4;

        #500   $finish;
    end
    endmodule
