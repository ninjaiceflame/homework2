module ep(
input wire [0:3] in,
output wire [7:0] out
);

assign out = {in[3], in[0], in[1], in[2], in[1], in[2], in[3], in[0]};

endmodule 