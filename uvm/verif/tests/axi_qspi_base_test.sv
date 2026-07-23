class axi_qspi_base_test extends uvm_test;
  `uvm_component_utils(axi_qspi_base_test)

  axi_qspi_env env;
  virtual ocl_axi_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = axi_qspi_env::type_id::create("env", this);
    if (!uvm_config_db#(virtual ocl_axi_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Missing ocl_axi_if for test")
  endfunction

endclass
