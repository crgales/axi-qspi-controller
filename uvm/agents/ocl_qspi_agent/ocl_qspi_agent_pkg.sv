package ocl_qspi_agent_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // QSPI transfer mode
  typedef enum logic [1:0] {
    SINGLE = 2'b00,
    DUAL   = 2'b01,
    QUAD   = 2'b10
  } qspi_mode_e;

  `include "ocl_qspi_config.svh"
  `include "ocl_qspi_seq_item.svh"
  typedef uvm_sequencer #(ocl_qspi_seq_item) ocl_qspi_sequencer;
  `include "ocl_qspi_driver.svh"
  `include "ocl_qspi_monitor.svh"
  `include "ocl_qspi_agent.svh"
  `include "ocl_qspi_seq_lib.svh"

endpackage : ocl_qspi_agent_pkg
