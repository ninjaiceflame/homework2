module fk(
input wire [3:0] a,
input wire [3:0] b,
input wire [7:0] key,
output wire [3:0] out
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [7:0] ep_out;
wire [7:0] xor_a_out;
wire [1:0] s0_out;
wire [1:0] s1_out;
wire [3:0] p4_out;
wire [3:0] xor_b_out;

//=======================================================
//  Structural coding
//=======================================================

//Perform expanded permutation
ep e_p(.in(b[3:0]), .out(ep_out[7:0]) );

//Xor output of EP and Key
assign xor_a_out = (ep_out[7:0] ^ key[7:0]);

//S0 box
s0 s_0(.in(xor_a_out[7:4]), .out(s0_out[1:0]) );

//S1 box
s1 s_1(.in(xor_a_out[3:0]), .out(s1_out[1:0]) );

//Perform P4 permutation 
p4 p_4(.in({s0_out[1:0], s1_out[1:0]}), .out(p4_out[3:0]) );

//Xor output of P4 and IP[7:4]
assign xor_b_out = (a[3:0] ^ p4_out[3:0]);

assign out = xor_b_out[3:0];


endmodule