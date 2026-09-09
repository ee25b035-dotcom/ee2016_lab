//Routes values to required adders
//input wire clk, wires a physical port clk as input, to which you give fpga clk as input
module unsigned_mult(
    input wire [3:0]a,b,
    output wire [7:0]m
    
    //reg vs wire?
    //wire is better because wallace multiplier physically 
    //connects carry outputs
    //because it is physical connection, no need to continuosuly write to update info
    //but reg, you need to update when required, so 
    //a value can be assigned only using always block
);
    wire[3:0]p0,p1,p2,p3;
    wire s5,s4,s3,s2,s1;
    wire c5,c4,c3,c2,c1,c0;
    wire i1,i2,i3,i4;
    wire k2,l2,k1,l1;
    assign p0=b&4{(a[0])};
    //mask to 4 bits then and
    assign p1=b&{4{a[1]}};
    assign p2=b&{4{a[2]}};
    assign p3=b&{4{a[3]}};
    //half adder part:
    m[0]=p0[0];
    half_adder h1(p0[0],p1[1],m[1],c0);
    full_adder f0(p0[2],p1[1],p2[0],s1,c1);
    half_adder h2(s1,c0,m[2],c5);
    half_adder h3(p2[1],p3[0],k1,l1);
    half_adder h7(p2[2],p3[1],k2,l2);
    full_adder f1(p0[3],p1[2],k1,s2,c2);
    full_adder h5(s2,c1,c5,m[3],i1);
    full_adder f2(p1[3],k2,l1,s3,c3);
    full_adder h4(s3,c2,i1,m[4],i2);
    full_adder f4(p2[3],p3[2],l2,s4,c4);
    full_adder h6(s4,c3,i2,m[5],i3);
    half_adder h8(p3[3],c4,m[6],m[7]);   
    //initial one no change, so set
endmodule