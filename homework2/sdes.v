module sdes(
input wire [9:0]SW,
output wire [9:0]LEDR
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [9:0] inputkey;
wire [7:0] key1out;
wire [7:0] key2out;
wire [7:0] ip_out;
wire [3:0] fk_a_out;
wire [3:0] fk_b_out;
wire [7:0] text;
//=======================================================
//  Structural coding
//=======================================================

assign inputkey [9:0] = 10'b0110010100;

//Generate two 8 bit keys from 10 bit key
keygen keyfn(.key10(inputkey[9:0]), .key1(key1out[7:0]), .key2(key2out[7:0]) );


/* 		ENCRYPTION			*/
//Perform first IP Permutation
//ip(.in(SW[7:0]), .ipout(ip_out[7:0]) );
//
////Scary Black box of fk
//fk fk_a(.a(ip_out[7:4]), .b(ip_out[3:0]), .key(key1out[7:0]), .out(fk_a_out[3:0]));
//
////Absolute magic
//fk fk_b(.a(ip_out[3:0]), .b(fk_a_out[3:0]), .key(key2out[7:0]), .out(fk_b_out[3:0]));
//
////Inverse results
//ip_inv inv(.in({fk_b_out[3:0],fk_a_out[3:0]}), .out(text[7:0]));
//
//assign LEDR[7:0] = text[7:0];
/*		END ENCRYPTION			*/



/* 		DECRYPTION			*/
//Perform first IP Permutation
ip(.in(SW[7:0]), .ipout(ip_out[7:0]) );

//Scary Black box of fk
fk fk_a(.a(ip_out[7:4]), .b(ip_out[3:0]), .key(key2out[7:0]), .out(fk_a_out[3:0]));

//Absolute magic
fk fk_b(.a(ip_out[3:0]), .b(fk_a_out[3:0]), .key(key1out[7:0]), .out(fk_b_out[3:0]));

//Inverse results
ip_inv inv(.in({fk_b_out[3:0],fk_a_out[3:0]}), .out(text[7:0]));

assign LEDR[7:0] = text[7:0];
/*		END DECRYPTION			*/
endmodule