## This file is a general .xdc for the Arty A7-35 Rev. D
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property IOSTANDARD LVCMOS33 [get_ports *]

## Clock signal
set_property -dict {PACKAGE_PIN N12 IOSTANDARD LVCMOS33} [get_ports clock]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clock]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clock_IBUF}]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_wiz/clk_in_clk_wiz_0}]



## LEDs
set_property -dict { PACKAGE_PIN R5    IOSTANDARD LVCMOS33 } [get_ports { io_led[0] }]; #IO_L24N_T3_35 Sch=led[4]
set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { io_led[1] }]; #IO_25_35 Sch=led[5]
set_property -dict { PACKAGE_PIN R6    IOSTANDARD LVCMOS33 } [get_ports { io_led[2] }]; #IO_L24P_T3_A01_D17_14 Sch=led[6]
set_property -dict { PACKAGE_PIN R7   IOSTANDARD LVCMOS33 } [get_ports { io_led[3] }]; #IO_L24N_T3_A00_D16_14 Sch=led[7]


################################################
# VGA Pins
################################################

## UART
#set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports {uart_tx}];
#set_property -dict {PACKAGE_PIN A9  IOSTANDARD LVCMOS33} [get_ports {uart_rx}];

## VGA Out
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports io_vga_hsync]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports io_vga_vsync]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {io_vga_r[0]}]
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {io_vga_r[1]}]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {io_vga_r[2]}]
set_property -dict {PACKAGE_PIN R11 IOSTANDARD LVCMOS33} [get_ports {io_vga_r[3]}]
set_property -dict {PACKAGE_PIN P8 IOSTANDARD LVCMOS33} [get_ports {io_vga_g[0]}]
set_property -dict {PACKAGE_PIN R8 IOSTANDARD LVCMOS33} [get_ports {io_vga_g[1]}]
set_property -dict {PACKAGE_PIN T7 IOSTANDARD LVCMOS33} [get_ports {io_vga_g[2]}]
set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS33} [get_ports {io_vga_g[3]}]
set_property -dict {PACKAGE_PIN N9 IOSTANDARD LVCMOS33} [get_ports {io_vga_b[0]}]
set_property -dict {PACKAGE_PIN P9 IOSTANDARD LVCMOS33} [get_ports {io_vga_b[1]}]
set_property -dict {PACKAGE_PIN M6 IOSTANDARD LVCMOS33} [get_ports {io_vga_b[2]}]
set_property -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS33} [get_ports {io_vga_b[3]}]


## SPI
set_property -dict { PACKAGE_PIN B10    IOSTANDARD LVCMOS33 } [get_ports { io_spi_mosi }]; #IO_L11N_T1_SRCC_35 Sch=jd[1]
set_property -dict { PACKAGE_PIN A10    IOSTANDARD LVCMOS33 } [get_ports { io_spi_miso }]; #IO_L12N_T1_MRCC_35 Sch=jd[2]
set_property -dict { PACKAGE_PIN D13    IOSTANDARD LVCMOS33 } [get_ports { io_spi_sclk }]; #IO_L13P_T2_MRCC_35 Sch=jd[3]
set_property -dict { PACKAGE_PIN B12    IOSTANDARD LVCMOS33 } [get_ports { io_spi_cs }]; #IO_L13N_T2_MRCC_35 Sch=jd[4]

# External GPIO
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { io_debug_loadframe }]; #IO_L14P_T2_SRCC_14           Sch=ck_io[5]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { io_debug_pixel }]; #IO_L14N_T2_SRCC_14           Sch=ck_io[6]
set_property -dict { PACKAGE_PIN N13   IOSTANDARD LVCMOS33 } [get_ports { io_debug_spiready  }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=ck_io[7]
set_property -dict { PACKAGE_PIN P13   IOSTANDARD LVCMOS33 } [get_ports { io_debug_state[0]  }]; #IO_L11P_T1_SRCC_14           Sch=ck_io[8]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { io_debug_state[1]  }]; #IO_L11P_T1_SRCC_14           Sch=ck_io[8]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { io_debug_state[2]  }]; #IO_L11P_T1_SRCC_14           Sch=ck_io[8]

# Reset
set_property -dict {PACKAGE_PIN N11 IOSTANDARD LVCMOS33} [get_ports io_aresetn]
