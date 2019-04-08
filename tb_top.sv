`define CLK_HALF_PERIOD #10

module tb_top;
   import uvm_pkg::*;
   import spi_flash_memory_pkg::*;
 
	bit i_cs_n;
	bit i_clk;
	bit i_hold_n;
	bit i_rst_n;
	bit i_wp_n;
	logic i_di;
	logic o_do;
   always `CLK_HALF_PERIOD i_clk <= ~i_clk;
 
   spi_flash_if      spi_f_if(i_cs_n, i_clk, i_hold_n, i_rst_n, i_wp_n, i_di, o_do);
   spi_flash_wrapper spi_f_wrapper(._if (spi_f_if));

   initial begin
      uvm_config_db #(virtual spi_flash_if)::set (null, "uvm_test_top", "spi_flash_if", spi_f_if);
      run_test();
   end
endmodule
