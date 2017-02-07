module tb;
    reg [0:0] a, b;
    wire [0:0] r;

    test DUT (
        .a(a),
        .b(b),
        .out(r)
    );

    initial begin
        #20
        a = 0;
        b = 0;
        $monitor("%h %h | %h", a, b, r);
        #20
        a = 0;
        b = 1;
        $monitor("%h %h | %h", a, b, r);
        #20
        a = 1;
        b = 0;
        $monitor("%h %h | %h", a, b, r);
        #20
        a = 1;
        b = 1;
        $monitor("%h %h | %h", a, b, r);
        #20
        $finish;
    end

endmodule
