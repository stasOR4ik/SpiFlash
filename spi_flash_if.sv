`ifndef SPI_FLASH_IF
`define SPI_FLASH_IF

interface spi_flash_if (
	input bit i_cs_n, // nCS
	input bit i_clk, // CLK
	input bit i_hold_n, // nHOLD
	input bit i_rst_n, // nRESET
	input bit i_wp_n, // WP
	input logic i_di, // DI
	output logic o_do); // DO
endinterface

`endif
