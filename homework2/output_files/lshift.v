module lshift(
input wire [4:0] in,
output wire [4:0] out
);

assign out = {in[3:0],in[4]};