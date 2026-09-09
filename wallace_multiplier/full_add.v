`timescale 1ns/ps
module full_adder(
    input a,
    input b,
    input c,
    output s,
    output cout;
)
    assign s=a^b^cin;
    assign cout=a&b|b&c|c&a;
endmodule