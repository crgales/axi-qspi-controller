`timescale 1ns/1ps

module axi_qspi_tb_top;
  import uvm_pkg::*;
  import axi_qspi_test_pkg::*;

  bit aclk;
  bit aresetn;

  initial begin
    aclk = 1'b0;
    forever #5 aclk = ~aclk;
  end

  initial begin
    aresetn = 1'b0;
    repeat (10) @(posedge aclk);
    aresetn = 1'b1;
  end

  ocl_axi_if axi_if(.aclk(aclk), .aresetn(aresetn));

  axi_qspi_wrapper dut (
    .i_qspi_aclk       (aclk),
    .i_qspi_aresetn    (axi_if.aresetn),
    .i_qspi_s_awaddr   (axi_if.s_awaddr),
    .i_qspi_s_awlen    (axi_if.s_awlen),
    .i_qspi_s_awsize   (axi_if.s_awsize),
    .i_qspi_s_awburst  (axi_if.s_awburst),
    .i_qspi_s_awvalid  (axi_if.s_awvalid),
    .o_qspi_s_awready  (axi_if.s_awready),
    .i_qspi_s_wdata    (axi_if.s_wdata),
    .i_qspi_s_wstrb    (axi_if.s_wstrb),
    .i_qspi_s_wlast    (axi_if.s_wlast),
    .i_qspi_s_wvalid   (axi_if.s_wvalid),
    .o_qspi_s_wready   (axi_if.s_wready),
    .o_qspi_s_bresp    (axi_if.s_bresp),
    .o_qspi_s_bvalid   (axi_if.s_bvalid),
    .i_qspi_s_bready   (axi_if.s_bready),
    .i_qspi_s_araddr   (axi_if.s_araddr),
    .i_qspi_s_arlen    (axi_if.s_arlen),
    .i_qspi_s_arsize   (axi_if.s_arsize),
    .i_qspi_s_arburst  (axi_if.s_arburst),
    .i_qspi_s_arvalid  (axi_if.s_arvalid),
    .o_qspi_s_arready  (axi_if.s_arready),
    .o_qspi_s_rdata    (axi_if.s_rdata),
    .o_qspi_s_rresp    (axi_if.s_rresp),
    .o_qspi_s_rlast    (axi_if.s_rlast),
    .o_qspi_s_rvalid   (axi_if.s_rvalid),
    .i_qspi_s_rready   (axi_if.s_rready),
    .i_qspi_m_araddr   (axi_if.m_araddr),
    .i_qspi_m_arlen    (axi_if.m_arlen),
    .i_qspi_m_arsize   (axi_if.m_arsize),
    .i_qspi_m_arburst  (axi_if.m_arburst),
    .i_qspi_m_arvalid  (axi_if.m_arvalid),
    .o_qspi_m_arready  (axi_if.m_arready),
    .o_qspi_m_rdata    (axi_if.m_rdata),
    .o_qspi_m_rresp    (axi_if.m_rresp),
    .o_qspi_m_rlast    (axi_if.m_rlast),
    .o_qspi_m_rvalid   (axi_if.m_rvalid),
    .i_qspi_m_rready   (axi_if.m_rready),
    .o_qspi_sclk       ( ),
    .o_qspi_cs_n       ( ),
    .i_qspi_io_i       ( ),
    .o_qspi_io_o       ( ),
    .o_qspi_io_oe      ( ),
    .o_qspi_irq        ( )
  );

  initial begin
    uvm_config_db#(virtual ocl_axi_if)::set(null, "uvm_test_top*", "vif", axi_if);
    uvm_config_db#(virtual ocl_axi_if)::set(null, "uvm_test_top.env.agent*", "vif", axi_if);
    run_test();
  end
endmodule
