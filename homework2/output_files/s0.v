module s0(
input wire [0:3] in,
output wire [1:0] out
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [1:0] row;
wire [1:0] column;

reg [1:0] box [0:3][0:3];

//=======================================================
//  Structural coding
//=======================================================
assign row = {in[0], in[3]};
assign column = {in[1], in[2]};

initial begin
 box[0][0] = 2'h1;
 box[0][1] = 2'h0;
 box[0][2] = 2'h3;
 box[0][3] = 2'h2;
 box[1][0] = 2'h3;
 box[1][1] = 2'h2;
 box[1][2] = 2'h1;
 box[1][3] = 2'h0;
 box[2][0] = 2'h0;
 box[2][1] = 2'h2;
 box[2][2] = 2'h1;
 box[2][3] = 2'h3;
 box[3][0] = 2'h3;
 box[3][1] = 2'h1;
 box[3][2] = 2'h3;
 box[3][3] = 2'h2;
end

//assign out = {row[1:0], column[1:0]};
assign out = box[row][column];

endmodule