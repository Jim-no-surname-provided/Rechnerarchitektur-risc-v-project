SRC = riscvsingle.vhdl

SIMDIR = sim

GHDL_FLAGS = --std=08 --ieee=synopsys --workdir=$(SIMDIR)

WAVEFORM_VIEWER = gtkwave

all: syntax analyse elaborate run

syntax:
	[ -d $(SIMDIR) ] || mkdir -p $(SIMDIR)
	ghdl -s $(GHDL_FLAGS) $(SRC)

analyse: syntax
	ghdl -a -Wno-hide -Wno-library $(GHDL_FLAGS) $(SRC)

elaborate: analyse
	ghdl -e $(GHDL_FLAGS) testbench

run: elaborate
	ghdl -r $(GHDL_FLAGS) testbench --wave=trace.ghw --vcd=trace.vcd --ieee-asserts=disable

view: trace.vcd
	$(WAVEFORM_VIEWER) trace.vcd

view_adv: trace.ghw
	$(WAVEFORM_VIEWER) trace.ghw
clean:
	rm -rf $(SIMDIR)
	rm -f  *.o
	rm -f  testbench
