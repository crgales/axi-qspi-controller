class ocl_qspi_monitor extends uvm_monitor;
  `uvm_component_utils(ocl_qspi_monitor)

  ocl_qspi_config cfg;
  virtual ocl_qspi_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(ocl_qspi_config)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("NOCFG", "Missing ocl_qspi_config configuration object")
    end
    vif = cfg.vif;
  endfunction
endclass : ocl_qspi_monitor