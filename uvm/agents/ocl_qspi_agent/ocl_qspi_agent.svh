class ocl_qspi_agent extends uvm_agent;
	`uvm_component_utils(ocl_qspi_agent)

	ocl_qspi_config       cfg;
	ocl_qspi_sequencer    seqr;
	ocl_qspi_driver       drv;
	ocl_qspi_monitor      mon;

	function new(string name = "ocl_qspi_agent", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if (!uvm_config_db#(ocl_qspi_config)::get(this, "", "cfg", cfg)) begin
			`uvm_fatal(get_type_name(), "Failed to get 'cfg' (ocl_qspi_config) from uvm_config_db")
		end

    uvm_config_db#(ocl_qspi_config)::set(this, "drv", "cfg", cfg);
    uvm_config_db#(ocl_qspi_config)::set(this, "mon", "cfg", cfg);

		mon = ocl_qspi_monitor::type_id::create("mon", this);

		if (cfg.active_passive == UVM_ACTIVE) begin
			seqr = ocl_qspi_sequencer::type_id::create("seqr", this);
			drv  = ocl_qspi_driver::type_id::create("drv", this);
		end
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if (cfg.active_passive == UVM_ACTIVE) begin
			drv.seq_item_port.connect(seqr.seq_item_export);
		end
	endfunction

endclass : ocl_qspi_agent

