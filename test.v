// iverilog -o test test.v test_tb.v && vvp test

module test (input a, b, output out);
    wire [0:0] y;
    my_xor u0 (
        .a(a),
        .b(b),
        .y(y)
    );

    assign out = ~y;
endmodule

module my_xor (input a, b, output y);
    wire x = a ~& b;
    assign y = (a ~& x) ~& (x ~& b);
endmodule
