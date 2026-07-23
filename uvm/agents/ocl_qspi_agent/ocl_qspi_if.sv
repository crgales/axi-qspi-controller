interface ocl_qspi_if (
  input logic clk,
  input logic rst_n
);

  logic        sclk;
  logic        cs_n;
  logic [3:0]  io_i;
  logic [3:0]  io_o;
  logic [3:0]  io_oe;
  logic        irq;

endinterface : ocl_qspi_if