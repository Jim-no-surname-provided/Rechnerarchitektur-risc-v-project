FILES = src/*.vhd
VHDLEX = .vhd

TESTBENCHPATH = tb/testbench$(VHDLEX)

SIMDIR = sim
WORKDIR = work
STOP_TIME = 500ns

#GHDL CONFIG
GHDL_CMD = ghdl
GHDL_FLAGS = --ieee=synopsys --workdir=$(SIMDIR) --work=$(WORKDIR) --std=08

#Simulation break condition
GHDL_SIM_OPT = --stop-time=$(STOP_TIME)

WAVEFORM_VIEWER = gtkwave

.PHONY: syntax analyze elaborate run view clean

all: syntax analyze elaborate run

syntax:
	[ -d $(SIMDIR) ] || mkdir -p $(SIMDIR)
	@$(GHDL_CMD) -s $(GHDL_FLAGS) $(FILES)
	@$(GHDL_CMD) -s $(GHDL_FLAGS) $(TESTBENCHPATH)

analyze: syntax
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES)
	@$(GHDL_CMD) -a $(GHDL_FLAGS) $(TESTBENCHPATH)

elaborate: analyze
	@$(GHDL_CMD) -e $(GHDL_FLAGS) testbench

$(SIMDIR)/result.vcd: run

run: elaborate
	@$(GHDL_CMD) -r $(GHDL_FLAGS) testbench --vcd=$(SIMDIR)/result.vcd

view: $(SIMDIR)/result.vcd
	$(WAVEFORM_VIEWER) $(SIMDIR)/result.vcd

clean:
	rm -rf $(SIMDIR)
	rm -rf $(WORKDIR)
	rm -f  *.o
	rm -f  testbench
