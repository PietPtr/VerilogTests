// 4 bit RAM module, 16 addresses storing 4 bit values.
module counter (input inc, load, reset, clock, input[3:0] in, output o1, o2, o3, o4, o5);
    reg[3:0] out;

    always @ (posedge clock)
    begin
        if (load)
            out <= in;
        if (inc)
            out <= out + 1;
        if (reset)
            out <= 0;
    end

    assign o1 = out[0];
    assign o2 = out[1];
    assign o3 = out[2];
    assign o4 = out[3];
    assign o5 = clock;
endmodule
