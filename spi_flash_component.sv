`ifndef SPI_FLASH_COMPONENT
`define SPI_FLASH_COMPONENT

class spi_flash_component #(type T = uvm_sequence_item) extends uvm_component;
	`uvm_component_utils(spi_flash_component)
	//`uvm_component_utils_begin(spi_flash_component)
	 /**** `uvm_field_* macro invocations here ****/
	//`uvm_component_utils_end

	typedef spi_flash_component #(T) this_type;
	uvm_analysis_imp#(T, this_type) ap;

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

	function void write(T t);

	endfunction
endclass

`endif