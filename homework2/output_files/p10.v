module p10(
input wire [9:0] in,
output wire [9:0] out
);

//index is -1 because it starts at 0
assign out = {in[2],in[4],in[1],in[6],in[3],in[9],in[0],in[8],in[8],in[5]};

endmodule