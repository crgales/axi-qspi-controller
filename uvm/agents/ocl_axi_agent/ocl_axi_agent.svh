class ocl_axi_agent extends uvm_agent;
  `uvm_component_utils(ocl_axi_agent)

  ocl_axi_config    cfg;
  ocl_axi_sequencer sequencer;
  ocl_axi_driver    driver;
  ocl_axi_monitor   monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(ocl_axi_config)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("NOCFG", "Missing ocl_axi_config configuration object")
    end

    uvm_config_db#(ocl_axi_config)::set(this, "monitor", "cfg", cfg);
    uvm_config_db#(ocl_axi_config)::set(this, "driver", "cfg", cfg);
    
    if (cfg.active_passive == UVM_ACTIVE) begin
      sequencer = ocl_axi_sequencer::type_id::create("sequencer", this);
      driver    = ocl_axi_driver::type_id::create("driver", this);
    end
    monitor   = ocl_axi_monitor::type_id::create("monitor", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.active_passive == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction
endclass
