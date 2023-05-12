module p4(
input wire [0:3] in,
output wire [3:0] out
);

assign out = {in[0], in[2], in[3], in[1]};

endmodule