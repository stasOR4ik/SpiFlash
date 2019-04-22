`ifndef SPI_TRANSACTION
`define SPI_TRANSACTION

class spi_transaction extends uvm_sequence_item;

  byte data;
  time tr_beginning;

  `uvm_object_utils_begin(spi_transaction)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_int(tr_beginning, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="spi_transaction");
    super.new(name);
  endfunction

endclass

`endif