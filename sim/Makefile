VERILATOR_BIN ?= C:/msys64/usr/bin/perl C:/msys64/ucrt64/bin/verilator
VERILATOR_FLAGS ?= --language 1800-2017
VLOG_BIN ?= vlog
VSIM_BIN ?= vsim
VLIB_BIN ?= vlib
VMAP_BIN ?= vmap

UVM_TEST ?= axi_qspi_all_test

UVM_FILELIST ?= filelist_uvm.f
TOP_MODULE ?= axi_qspi_wrapper

AXI_QSPI_RTL ?= ../rtl
export AXI_QSPI_RTL
AXI_QSPI_SRC = -f $(AXI_QSPI_RTL)/filelist.f
AXI_QSPI_OPTS = 

UVM_DIR ?= ../uvm

AXI_UVM_AGENT = $(UVM_DIR)/agents/ocl_axi_agent/ocl_axi_agent_pkg.sv
AXI_UVM_AGENT += $(UVM_DIR)/agents/ocl_axi_agent/ocl_axi_if.sv
AXI_UVM_OPTS = +incdir+$(UVM_DIR)/agents/ocl_axi_agent

QSPI_UVM_AGENT = $(UVM_DIR)/agents/ocl_qspi_agent/ocl_qspi_agent_pkg.sv
QSPI_UVM_AGENT += $(UVM_DIR)/agents/ocl_qspi_agent/ocl_qspi_if.sv
QSPI_UVM_OPTS = +incdir+$(UVM_DIR)/agents/ocl_qspi_agent

AXI_ENV_DIR ?= ../uvm/verif
AXI_ENV_PKGS = $(AXI_ENV_DIR)/env/axi_qspi_env_pkg.sv \
               $(AXI_ENV_DIR)/sequences/axi_qspi_seq_pkg.sv \
			   $(AXI_ENV_DIR)/tests/axi_qspi_test_pkg.sv

AXI_TB = $(AXI_ENV_DIR)/tb/axi_qspi_tb_top.sv

.PHONY: all lint uvm_compile uvm_run clean

all: compile run

lint:
	$(VERILATOR_BIN) $(VERILATOR_FLAGS) --lint-only -f $(FILELIST) --top-module $(TOP_MODULE)

compile:
	$(VLIB_BIN) work
	$(VMAP_BIN) work work
	$(VLOG_BIN) $(AXI_QSPI_SRC) $(AXI_QSPI_OPTS)
	$(VLOG_BIN) $(QSPI_UVM_AGENT) $(QSPI_UVM_OPTS)
	$(VLOG_BIN) $(AXI_UVM_AGENT) $(AXI_UVM_OPTS)
	$(VLOG_BIN) $(AXI_ENV_PKGS)
	$(VLOG_BIN) $(AXI_TB)

opt:

run:
	$(VSIM_BIN) -c axi_qspi_tb_top +UVM_TESTNAME=$(UVM_TEST) +UVM_NO_RELNOTES -do "run -all; quit -f"

clean:
	rm -rf obj_dir
	rm -rf work transcript qwave.db design.bin *.ini tr_db.log
