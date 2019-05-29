`ifndef SPI_DRRIVER
`define SPI_DRIVER

`include "spi_flash_if.sv"
`include "spi_flash_transaction.sv"

class spi_flash_driver extends uvm_driver #(spi_transaction);
 
  virtual spi_flash_if vif;
 
  `uvm_component_utils(spi_flash_driver)
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual spi_flash_if)::get(this, "", "vif", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
 
  virtual task run_phase(uvm_phase phase);
    forever begin
    seq_item_port.get_next_item(req);
    drive();
    seq_item_port.item_done();
    end
  endtask : run_phase

  virtual task drive();
      for (int i = 0; i <= 7; i = i + 1) begin
  	  	 @(posedge vif.i_clk);
                 vif.o_do = req.data[i];
      end    
  endtask : drive
 
endclass : spi_flash_driver
`endif
