class ocl_axi_monitor extends uvm_component;
  `uvm_component_utils(ocl_axi_monitor)

  virtual ocl_axi_if vif;
  uvm_analysis_port #(ocl_axi_seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ocl_axi_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Missing ocl_axi_if for monitor")
  endfunction

  task run_phase(uvm_phase phase);
    fork
      monitor_write_resp();
      monitor_read_resp();
    join
  endtask

  task automatic monitor_write_resp();
    ocl_axi_seq_item tr;
    forever begin
      @(posedge vif.aclk);
      if (vif.s_bvalid && vif.s_bready) begin
        tr = ocl_axi_seq_item::type_id::create("wr_rsp");
        tr.cmd  = OCL_AXI_WRITE;
        tr.resp = vif.s_bresp;
        ap.write(tr);
      end
    end
  endtask

  task automatic monitor_read_resp();
    ocl_axi_seq_item tr;
    forever begin
      @(posedge vif.aclk);
      if (vif.s_rvalid && vif.s_rready) begin
        tr = ocl_axi_seq_item::type_id::create("rd_rsp");
        tr.cmd  = OCL_AXI_READ;
        tr.data = vif.s_rdata;
        tr.resp = vif.s_rresp;
        ap.write(tr);
      end
    end
  endtask
endclass
