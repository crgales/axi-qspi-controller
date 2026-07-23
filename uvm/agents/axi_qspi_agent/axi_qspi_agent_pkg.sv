package axi_qspi_agent_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "axi_qspi_axi_item.sv"
  `include "axi_qspi_axi_driver.sv"
  `include "axi_qspi_axi_monitor.sv"
  typedef uvm_sequencer #(axi_qspi_axi_item) axi_qspi_axi_sequencer;
  `include "axi_qspi_agent.sv"
endpackage : axi_qspi_agent_pkg