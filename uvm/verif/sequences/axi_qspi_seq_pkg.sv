package axi_qspi_seq_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import axi_qspi_pkg::*;
  import ocl_axi_agent_pkg::*;

  `include "axi_qspi_base_seq.svh"
  `include "axi_qspi_reg_smoke_seq.svh"
  `include "axi_qspi_xip_seq.svh"
  `include "axi_qspi_axi_skew_seq.svh"
  `include "axi_qspi_fifo_irq_seq.svh"
  `include "axi_qspi_slverr_seq.svh"
  `include "axi_qspi_all_seq.svh"
endpackage : axi_qspi_seq_pkg