class ocl_axi_seq_item extends uvm_sequence_item;
  `uvm_object_utils(ocl_axi_seq_item)

  rand ocl_axi_cmd_e      cmd;
  rand bit [31:0]         addr;
  rand bit [31:0]         data;
  rand bit [3:0]          strb;
  rand bit [7:0]          len;
  rand bit [7:0]          burst_len;
       bit [1:0]          expected_resp;
  rand int unsigned       aw_delay;
  rand int unsigned       w_delay;
  rand int unsigned       r_ready_delay;
       bit [1:0]          resp;

  constraint c_default {
    strb inside {[4'h1:4'hF]};
    aw_delay <= 8;
    w_delay <= 8;
    r_ready_delay <= 8;
    burst_len == 0;
  }

  function new(string name = "ocl_axi_seq_item");
    super.new(name);
    strb          = 4'hF;
    len           = 8'd0;
    burst_len     = 8'd0;
    expected_resp = 2'b00;
  endfunction

  function void do_copy(uvm_object rhs);
    ocl_axi_seq_item rhs_;
    if (!$cast(rhs_, rhs)) begin
      uvm_report_error("do_copy", "Failed to cast rhs to ocl_axi_seq_item");
      return;
    end
    super.do_copy(rhs);
    cmd            = rhs_.cmd;
    addr           = rhs_.addr;
    data           = rhs_.data;
    strb           = rhs_.strb;
    len            = rhs_.len;
    burst_len      = rhs_.burst_len;
    expected_resp  = rhs_.expected_resp;
    aw_delay       = rhs_.aw_delay;
    w_delay        = rhs_.w_delay;
    r_ready_delay  = rhs_.r_ready_delay;
    resp           = rhs_.resp;
  endfunction

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    ocl_axi_seq_item rhs_;
    if (!$cast(rhs_, rhs)) begin
      uvm_report_error("do_compare", "Failed to cast rhs to ocl_axi_seq_item");
      return 0;
    end
    return super.do_compare(rhs, comparer)
      && (cmd           == rhs_.cmd)
      && (addr          == rhs_.addr)
      && (data          == rhs_.data)
      && (strb          == rhs_.strb)
      && (len           == rhs_.len)
      && (burst_len     == rhs_.burst_len)
      && (expected_resp == rhs_.expected_resp)
      && (aw_delay      == rhs_.aw_delay)
      && (w_delay       == rhs_.w_delay)
      && (r_ready_delay == rhs_.r_ready_delay)
      && (resp          == rhs_.resp);
  endfunction

  function string convert2string();
    string s;
    s = super.convert2string();
    s = {s, $sformatf("\n  cmd = %s", cmd.name())};
    s = {s, $sformatf("\n  addr = 0x%08h", addr)};
    s = {s, $sformatf("\n  data = 0x%08h", data)};
    s = {s, $sformatf("\n  strb = 0x%01h", strb)};
    s = {s, $sformatf("\n  len = 0x%02h", len)};
    s = {s, $sformatf("\n  burst_len = 0x%02h", burst_len)};
    s = {s, $sformatf("\n  expected_resp = 0x%02h", expected_resp)};
    s = {s, $sformatf("\n  aw_delay = %0d", aw_delay)};
    s = {s, $sformatf("\n  w_delay = %0d", w_delay)};
    s = {s, $sformatf("\n  r_ready_delay = %0d", r_ready_delay)};
    s = {s, $sformatf("\n  resp = 0x%02h", resp)};
    return s;
  endfunction

endclass
