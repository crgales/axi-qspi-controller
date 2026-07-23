class ocl_axi_config extends uvm_object;
  `uvm_object_utils(ocl_axi_config)

  virtual ocl_axi_if vif;
  uvm_active_passive_enum active_passive = UVM_ACTIVE;

  function new(string name = "ocl_axi_config");
    super.new(name);
  endfunction
endclass