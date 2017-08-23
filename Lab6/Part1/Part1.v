module Part1(SW, KEY, LEDR);
	input [9:0]SW;
	input [0:0] KEY;
	output [9:0]LEDR;
	wire reset, w, clock, z;
	assign reset = SW[0];
	assign w = SW[1];
	assign clock = KEY[0];
	assign LEDR[9] = z;
	reg [8:0]y;
	wire [8:0]Y;
	
	assign Y[8] = reset & (w & (y[7] | y[8]));
	assign Y[7] = reset & (w & y[6]);
	assign Y[6] = reset & (w & y[5]);
	assign Y[5] = reset & (w & (y[0] | y[1] | y[2] | y[3] | y[4]));
	assign Y[4] = reset & (~w & (y[3] | y[4]));
	assign Y[3] = reset & (~w & y[2]);
	assign Y[2] = reset & (~w & y[1]);
	assign Y[1] = reset & (~w & (y[0] | y[5] | y[6] | y[7] | y[8]));
	assign Y[0] = ~reset;
	
	assign z = y[4] | y[8];
	
	always @(posedge clock)
	begin
		y<= Y;
	end
	
	assign LEDR[8:0] = y[8:0];
	
endmodule