`ifndef SPI_FLASH_COMPONENT
`define SPI_FLASH_COMPONENT
	import uvm_pkg::*;

	`include "uvm_macros.svh"
	`include "spi_flash_transaction.sv"

typedef enum byte 
{
	page_program = 8'b00000010
} commands;

class spi_flash_component extends uvm_component;
	`uvm_component_utils(spi_flash_component)

	typedef spi_transaction transaction_type;

	uvm_analysis_imp#(transaction_type, spi_flash_component) ap;

	byte memory[24'h0:24'hFFFFFF];

	bit[23:0] address;

	byte cmd;

	bit isCommand = 1;

	int counter = 1;

	function new(string name = "spi_flash_component", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap = new("ap", this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	phase.raise_objection(this);

    	phase.drop_objection(this);
	endtask

	function void write(transaction_type transaction);
		counter++;
		if(isCommand) begin
			cmd = transaction.data;
			isCommand = 0;
		end else begin
			case (cmd)
				page_program : begin
					case (counter)
						2: begin 
							address[23:16] = transaction.data;

						end
						3: begin 
							address[15:8] = transaction.data;
						end
						4: begin 
							address[7:0] = transaction.data;
						end
						261: begin

							counter = 1;
						end
						default : begin
							$display("Data %h", transaction.data);
							memory[address] = transaction.data;
							$display("%h %h %h", memory[24'h030405], memory[24'h030406], memory[24'h030407]);
							$display("Address %h", address);
							address++;
						end
					endcase

				end

				default :;
			endcase
		end
	endfunction
endclass


module test_tb;
	typedef spi_transaction transaction_type;
	spi_flash_component a;
	transaction_type transaction;
   initial begin
   		a = new();
   		transaction = new();
		transaction.data = 2;
   		for (int i = 0; i < 7; i++) begin
   			a.write(transaction);
   			transaction.data++;
   		end
   end
endmodule


`endif