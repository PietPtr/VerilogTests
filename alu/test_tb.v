module tb;
    reg [0:0] a, b;
    wire [0:0] carry, sum;

    halfadder DUT (
        .a(a),
        .b(b),
        .carry(carry),
        .sum(sum)
    );

    initial begin
        #20
        a = 0;
        b = 0;
        $monitor("%h %h | %h %h", a, b, carry, sum);
        #20
        a = 0;
        b = 1;
        $monitor("%h %h | %h %h", a, b, carry, sum);
        #20
        a = 1;
        b = 0;
        $monitor("%h %h | %h %h", a, b, carry, sum);
        #20
        a = 1;
        b = 1;
        $monitor("%h %h | %h %h", a, b, carry, sum);
        #20
        $finish;
    end

endmodule
