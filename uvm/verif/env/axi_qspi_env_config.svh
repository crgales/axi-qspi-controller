class axi_qspi_env_config extends uvm_object;
  `uvm_object_utils(axi_qspi_env_config)

  ocl_axi_config axi_cfg;

  function new(string name = "axi_qspi_env_config");
    super.new(name);
  endfunction

  function void create_configs();
    axi_cfg = ocl_axi_config::type_id::create("axi_cfg");
  endfunction
endclass