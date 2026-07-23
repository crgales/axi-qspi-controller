class axi_qspi_base_test extends uvm_test;
  `uvm_component_utils(axi_qspi_base_test)

  axi_qspi_env_config cfg;
  axi_qspi_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg = axi_qspi_env_config::type_id::create("cfg");
    cfg.create_configs();  // Creates sub-configurations for axi_cfg

    if (!uvm_config_db#(virtual ocl_axi_if)::get(this, "", "axi_vif", cfg.axi_cfg.vif)) begin
      `uvm_fatal("NOVIF", "Missing AXI virtual interface for test")
    end

    if (!uvm_config_db#(virtual ocl_qspi_if)::get(this, "", "qspi_vif", cfg.qspi_cfg.vif)) begin
      `uvm_fatal("NOVIF", "Missing QSPI virtual interface for test")
    end

    uvm_config_db#(axi_qspi_env_config)::set(this, "env", "cfg", cfg);
    env = axi_qspi_env::type_id::create("env", this);

  endfunction

endclass
