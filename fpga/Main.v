module Main(
  input   clock,
  input   reset,
  output  io_led_0,
  output  io_led_1,
  output  io_led_2,
  output  io_led_3,
  input   io_btn_0,
  input   io_btn_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  counter; // @[Main.scala 10:20]
  wire [1:0] _GEN_6 = {{1'd0}, counter}; // @[Main.scala 23:16]
  wire [2:0] _GEN_8 = {{2'd0}, counter}; // @[Main.scala 30:16]
  assign io_led_0 = _GEN_8 == 3'h4 | counter; // @[Main.scala 30:25 Main.scala 32:15]
  assign io_led_1 = 1'h0; // @[Main.scala 16:13]
  assign io_led_2 = _GEN_6 == 2'h2; // @[Main.scala 23:16]
  assign io_led_3 = _GEN_6 == 2'h3; // @[Main.scala 26:16]
  always @(posedge clock) begin
    if (_GEN_8 == 3'h4) begin // @[Main.scala 30:25]
      counter <= 1'h0; // @[Main.scala 31:13]
    end else if (io_btn_0) begin // @[Main.scala 12:30]
      counter <= counter + 1'h1; // @[Main.scala 13:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  counter = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
