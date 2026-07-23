// SystemVerilog Header
class ocl_qspi_config extends uvm_object;
	`uvm_object_utils(ocl_qspi_config)

	uvm_active_passive_enum active_passive = UVM_ACTIVE;
	virtual ocl_qspi_if vif;

	function new(string name = "ocl_qspi_config");
		super.new(name);
	endfunction

endclass : ocl_qspi_config
