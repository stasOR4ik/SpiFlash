`ifndef SPI_TRANSACTION
`define SPI_TRANSACTION

typedef enum { IN_PROGRESS, END } command_status;

class spi_transaction extends uvm_sequence_item;

  byte unsigned data;
  time tr_beginning;
  command_status status;

  `uvm_object_utils_begin(spi_transaction)
    `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_int(tr_beginning, UVM_ALL_ON)
    `uvm_field_enum(command_status, status, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="spi_transaction");
    super.new(name);
  endfunction

endclass

`endif