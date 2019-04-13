`ifndef SPI_FLASH_COMPONENT
`define SPI_FLASH_COMPONENT

class spi_flash_component extends uvm_component;
	`uvm_component_utils(spi_flash_component)

	typedef uvm_sequence_item transaction_type;

	uvm_analysis_imp#(transaction_type, spi_flash_component) ap;

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

	endfunction
endclass

`endif