module p8(
input wire [9:0] in,
outpur wire [7:0] out
);


//index is -1 because it starts at 0
assign out = {in[5],in[2],in[6],in[3],in[7],in[4],in[9],in[8]};