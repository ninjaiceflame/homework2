module s0(
input wire [3:0] in,
output wire [1:0] out
);

wire [1:0] row;
wire [1:0] column;

assign row = {in[3], in[0]};

assign out = row;

endmodule