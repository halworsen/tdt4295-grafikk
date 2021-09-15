# FPGA

## Getting started

In order to get set up for the FPGA project, you will need `scala` and `sbt` for the chisel
programming, as well as `vivado` for synthesizing and programming.

### Chisel and FPGA programming

For the chisel part, all you need to do is run `sbt run` in this directory to compile the chisel
code and output verilog.

**Remember to format all code with `scalafmt` and run tests with `sbt test`!**

### Vivado

To set up the vivado project, open up vivado and in the tcl console:

1. Change directory to this directory.
2. Source the `tdt4195-graphics.tcl` script: `source tdt4195-graphics.tcl`
