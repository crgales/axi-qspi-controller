class ocl_axi_agent extends uvm_agent;
  `uvm_component_utils(ocl_axi_agent)

  ocl_axi_sequencer sequencer;
  ocl_axi_driver    driver;
  ocl_axi_monitor   monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer = ocl_axi_sequencer::type_id::create("sequencer", this);
    driver    = ocl_axi_driver::type_id::create("driver", this);
    monitor   = ocl_axi_monitor::type_id::create("monitor", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
