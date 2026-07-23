package axi_qspi_test_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import axi_qspi_env_pkg::*;
  import axi_qspi_seq_pkg::*;

  `include "axi_qspi_base_test.sv"
  `include "axi_qspi_all_test.sv"
  `include "axi_qspi_axi_skew_test.sv"
  `include "axi_qspi_fifo_irq_test.sv"
  `include "axi_qspi_slverr_test.sv"
  `include "axi_qspi_reg_test.sv"
  `include "axi_qspi_xip_test.sv"

endpackage : axi_qspi_test_pkg