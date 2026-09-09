timescale 1ns/ps
module half_adder(
    input a,
    input b,
    output s,
    output cout;
)
    s=a^b;
    cout=a&b;
endmodule