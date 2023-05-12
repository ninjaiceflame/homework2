module sdes(
input wire [9:0]SW,
output wire [9:0]LEDR
);

keygen key(.key10(SW[9:0]), .key2(LEDR[7:0]) );

endmodule