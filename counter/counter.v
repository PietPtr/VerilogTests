// 4 bit RAM module, 16 addresses storing 4 bit values.
module counter (input inc, load, clock, reset, input[3:0] in, output o1, o2, o3, o4, o5);
    reg[3:0] out;
    reg slow_clock = 1;
    reg[22:0] clock_counter = 1;

    always @ (posedge clock)
    begin
        if (clock_counter > 1200000) begin
            clock_counter = 0;
            slow_clock <= ~slow_clock;
            end
        else begin
            clock_counter <= clock_counter + 1;
            end
    end

    always @ (posedge slow_clock)
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
    assign o5 = slow_clock;
endmodule
