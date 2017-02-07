module test (input a, b, output y);
  wire x = a ~& b;
  assign y = (a ~& x) ~& (x ~& b);
endmodule
