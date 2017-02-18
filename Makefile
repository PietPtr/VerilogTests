PROJ = test
TOP = halfadder

all :
	yosys -p 'read_verilog $(PROJ).v; synth_ice40 -blif $(PROJ).blif -top $(TOP)'

	arachne-pnr -d 1k -o $(PROJ).asc -p $(PROJ).pcf $(PROJ).blif

	icepack $(PROJ).asc $(PROJ).bin

yosys :
	yosys -p 'read_verilog $(PROJ).v; synth_ice40 -blif $(PROJ).blif -top $(TOP)'

arachne :
	arachne-pnr -d 1k -o ice.asc -p ice.pcf ice.blif

icepack :
	icepack ice.asc ice.bin

program :
	iceprog $(PROJ).bin

prog : program
