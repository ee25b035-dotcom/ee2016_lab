timescale 1ns/ps
module full_adder(
    input a,
    input b,
    input cin,
    output s,
    output cout;
)
    s=a^b^cin;
    cout=a&b|b&c|c&a;
endmodule