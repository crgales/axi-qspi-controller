package ocl_axi_agent_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  typedef enum int {
    OCL_AXI_WRITE,
    OCL_AXI_READ,
    OCL_AXI_MEM_READ
  } ocl_axi_cmd_e;

  `include "ocl_axi_seq_item.svh"
  `include "ocl_axi_driver.svh"
  `include "ocl_axi_monitor.svh"
  typedef uvm_sequencer #(ocl_axi_seq_item) ocl_axi_sequencer;
  `include "ocl_axi_agent.svh"
endpackage : ocl_axi_agent_pkg