module part1_1(SW, KEY, LEDR);
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
	
	assign Y[8] = (w & (y[7] | y[8]));
	assign Y[7] = (w & y[6]);
	assign Y[6] = (w & y[5]);
	assign Y[5] = (w & (y[0] | y[1] | y[2] | y[3] | y[4]));
	assign Y[4] = (~w & (y[3] | y[4]));
	assign Y[3] = (~w & y[2]);
	assign Y[2] = (~w & y[1]);
	assign Y[1] = (~w & (~y[0] | y[5] | y[6] | y[7] | y[8]));
	
	assign z = y[4] | y[8];
	
	always @(posedge clock)
	begin
		if(!reset)
			y <= 9'b000000000;
		else
			y<= Y;
	end
	
	assign LEDR[8:0] = y[8:0];
	
endmodule