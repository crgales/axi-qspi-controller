package axi_qspi_seq_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import axi_qspi_pkg::*;
  import axi_qspi_agent_pkg::*;

  `include "axi_qspi_base_seq.sv"
  `include "axi_qspi_reg_smoke_seq.sv"
  `include "axi_qspi_xip_seq.sv"
  `include "axi_qspi_axi_skew_seq.sv"
  `include "axi_qspi_fifo_irq_seq.sv"
  `include "axi_qspi_slverr_seq.sv"
  `include "axi_qspi_all_seq.sv"
endpackage : axi_qspi_seq_pkg