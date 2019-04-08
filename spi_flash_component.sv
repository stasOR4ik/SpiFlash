`ifndef SPI_FLASH_COMPONENT
`define SPI_FLASH_COMPONENT

class spi_flash_component extends uvm_component ;
	`uvm_component_utils(spi_flash_component)
	//`uvm_component_utils_begin(spi_flash_component)
	 /**** `uvm_field_* macro invocations here ****/
	//`uvm_component_utils_end

	function new(string name = "spi_flash_component", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
    	phase.raise_objection(this);

    	phase.drop_objection(this);
	endtask
endclass

`endif

