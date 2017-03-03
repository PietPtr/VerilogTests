PROJ = mem
TOP = mem

all : yosys arachne icepack

yosys :
	yosys -p 'read_verilog $(PROJ).v; synth_ice40 -blif $(PROJ).blif -top $(TOP)'

arachne :
	arachne-pnr -d 1k -o $(PROJ).asc -p $(PROJ).pcf $(PROJ).blif

icepack :
	icepack $(PROJ).asc $(PROJ).bin

program :
	iceprog $(PROJ).bin

prog : program

show :
	yosys -p 'read_verilog test.v; show'
