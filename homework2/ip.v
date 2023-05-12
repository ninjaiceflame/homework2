module ip(
input wire [0:7] in,
output wire [7:0] ipout
);

//index is -1 because it starts at 0
assign ipout = {in[1], in[5], in[2], in[0], in[3], in[7], in[4], in[6]};

endmodule

//Inverse IP
module ip_inv(
input wire [0:7] in,
output wire [7:0] out
);

//index is -1 because it starts at 0
assign out = {in[3], in[0], in[2], in[4], in[6], in[1], in[7], in[5]};

endmodule