module lshift2(
input wire [4:0] in,
output wire [4:0] out
);

assign out = {in[2:0],in[4:3]};

endmodule