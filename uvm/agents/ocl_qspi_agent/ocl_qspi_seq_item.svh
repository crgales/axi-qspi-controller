class ocl_qspi_seq_item extends uvm_sequence_item;

  `uvm_object_utils(ocl_qspi_seq_item)

  // Transaction fields
  rand logic [7:0]  cmd;           // SPI command byte
  rand logic [31:0] addr;          // Address field
  rand logic [31:0] data;          // Write data
  rand logic [7:0]  dummy_cycles;  // Number of dummy cycles
  rand qspi_mode_e  mode;          // Transfer mode: SINGLE, DUAL, QUAD

  logic [31:0] read_data;          // Captured read data (non-rand)

  // Constraints
  constraint valid_cmd_c {
    cmd inside {8'h02, 8'h03, 8'h0B, 8'h32, 8'h6B, 8'hEB};
  }

  constraint valid_dummy_cycles_c {
    dummy_cycles inside {[0:8]};
  }

  // Constructor
  function new(string name = "ocl_qspi_seq_item");
    super.new(name);
  endfunction : new

  // Convert transaction to string for display
  virtual function string convert2string();
    return $sformatf("CMD=0x%0h ADDR=0x%0h DATA=0x%0h DUMMY=%0d MODE=%s READ_DATA=0x%0h",
                     cmd, addr, data, dummy_cycles, mode.name(), read_data);
  endfunction : convert2string

  // Deep copy
  virtual function void do_copy(uvm_object rhs);
    ocl_qspi_seq_item rhs_cast;
    if (!$cast(rhs_cast, rhs)) begin
      `uvm_fatal("OCL_QSPI_SEQ_ITEM", "do_copy: rhs is not of type ocl_qspi_seq_item")
    end
    super.do_copy(rhs);
    this.cmd          = rhs_cast.cmd;
    this.addr         = rhs_cast.addr;
    this.data         = rhs_cast.data;
    this.dummy_cycles = rhs_cast.dummy_cycles;
    this.mode         = rhs_cast.mode;
    this.read_data    = rhs_cast.read_data;
  endfunction : do_copy

  // Comparison
  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    ocl_qspi_seq_item rhs_cast;
    if (!$cast(rhs_cast, rhs)) begin
      `uvm_fatal("OCL_QSPI_SEQ_ITEM", "do_compare: rhs is not of type ocl_qspi_seq_item")
      return 0;
    end
    return (super.do_compare(rhs, comparer)    &&
             (this.cmd          == rhs_cast.cmd)          &&
             (this.addr         == rhs_cast.addr)         &&
             (this.data         == rhs_cast.data)         &&
             (this.dummy_cycles == rhs_cast.dummy_cycles) &&
             (this.mode         == rhs_cast.mode)         &&
             (this.read_data    == rhs_cast.read_data));
  endfunction : do_compare

endclass : ocl_qspi_seq_item
