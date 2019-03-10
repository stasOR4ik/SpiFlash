`ifndef ISPIFLASH
`define ISPIFLASH

interface ISpiFlash (
	input bit nChipSelect,
	input bit clk,
	input bit nHold,
	input bit writeProctect,
	input logic dataInput,
	output logic dataOutput);
endinterface

`endif
