class axi_qspi_env extends uvm_env;
  `uvm_component_utils(axi_qspi_env)

  axi_qspi_env_config cfg;
  ocl_axi_agent       m_axi_agent;
  ocl_qspi_agent      m_qspi_agent;
  axi_qspi_scoreboard sb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(axi_qspi_env_config)::get(this, "", "cfg", cfg)) begin
      `uvm_fatal("NOCFG", "Missing axi_qspi_env_config configuration object")
    end

    uvm_config_db#(ocl_axi_config)::set(this, "m_axi_agent", "cfg", cfg.axi_cfg);
    m_axi_agent = ocl_axi_agent::type_id::create("m_axi_agent", this);

    uvm_config_db#(ocl_qspi_config)::set(this, "m_qspi_agent", "cfg", cfg.qspi_cfg);
    m_qspi_agent = ocl_qspi_agent::type_id::create("m_qspi_agent", this);

    sb          = axi_qspi_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_axi_agent.monitor.ap.connect(sb.item_export);
  endfunction
endclass
