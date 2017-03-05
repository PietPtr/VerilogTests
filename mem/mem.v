// 4 bit RAM module, 16 addresses storing 4 bit values.
module mem (input load, clock, input[3:0] in, addr, output o1, o2, o3, o4, o5);
    reg[3:0] memory[15:0];

    always @ (posedge clock)
    if (load) begin
        memory[addr] <= in;
    end

    assign o1 = memory[addr][0];
    assign o2 = memory[addr][1];
    assign o3 = memory[addr][2];
    assign o4 = memory[addr][3];
    assign o5 = load;
endmodule
