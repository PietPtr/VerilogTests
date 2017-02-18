// iverilog -o test test.v test_tb.v && vvp test

module test (input a, b, output out);
    wire [0:0] y;

    assign out = y;
endmodule

module halfadder (input a, b, output carry, sum, oa, ob);
    assign a = oa;
    assign b = ob;
    assign carry = a & b;
    assign sum = a ^ b;
endmodule

module fulladder (input a, b, c, output carry, sum);
    wire carry0;
    wire carry1;
    wire sum0;
    wire sum1;

    halfadder h0 (
        .a(a),a
        .b(b),
        .carry(carry0),
        .sum(sum0)
    );

    halfadder h1 (
        .a(sum0),
        .b(c),
        .carry(carry1),
        .sum(sum1)
    );

    assign carry = carry0 | carry1;
    assign sum = sum1;
endmodule

module alu (input a[4], b[4], output r[4]);
    assign r = a;
endmodule
