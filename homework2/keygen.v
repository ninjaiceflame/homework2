module keygen(
input wire [9:0]key10,
output wire[7:0] key1,
output wire [7:0] key2
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [9:0] p10out;
wire [9:0] ls1out;
wire [9:0] ls2out;

//=======================================================
//  Structural coding
//=======================================================

//Put 10 digit key into P10
p10 p_10(.in(key10[9:0]), .out(p10out[9:0]) );

//Shift left 1 bit
lshift ls1_A(.in(p10out[9:5]), .out(ls1out[9:5]) );
lshift ls1_B(.in(p10out[4:0]), .out(ls1out[4:0]) );

//Key 1
p8 p_8_A(.in(ls1out[9:0]), .out(key1[7:0]) );


//Shift left 2 bits
lshift2 ls2_A(.in(ls1out[9:5]), .out(ls2out[9:5]) );
lshift2 ls2_B(.in(ls1out[4:0]), .out(ls2out[4:0]) );

//Key 2
p8 p_8_B(.in(ls2out[9:0]), .out(key2[7:0]) );

endmodule