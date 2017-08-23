module part1(SW, HEX0, HEX1);
	input [9:0] SW;
	output [0:6] HEX0, HEX1;
	
	wire A, B, C, D, A1, B1, C1, D1;
	
	assign A = SW[7];
	assign B = SW[6];
	assign C = SW[5];
	assign D = SW[4];
	assign A1 = SW[3];
	assign B1 = SW[2];
	assign C1 = SW[1];
	assign D1 = SW[0];
	
	assign HEX0[0] = A | C | (B&D) | (~B&~D);
	assign HEX0[1] = ~B | (~C&~D) | (C&D);
	assign HEX0[2] = B | ~C | D;
	assign HEX0[3] = (~B&~D) | (C&~D) | (B&~C&D) | (~B&C) | A;
	assign HEX0[4] = (~B&~D) | (C&~D);
	assign HEX0[5] = A | (~C&~D) | (B&~C) | (B&~D);
	assign HEX0[6] = A | (B&~C) | (~B&C) | (C&~D);
	
	assign HEX1[0] = A1 | C1 | (B1&D1) | (~B1&~D1);
	assign HEX1[1] = ~B1 | (~C1&~D1) | (C1&D1);
	assign HEX1[2] = B1 | ~C1 | D1;
	assign HEX1[3] = (~B1&~D1) | (C1&~D1) | (B1&~C1&D1) | (~B1&C1) | A1;
	assign HEX1[4] = (~B1&~D1) | (C1&~D1);
	assign HEX1[5] = A1 | (~C1&~D1) | (B1&~C1) | (B1&~D1);
	assign HEX1[6] = A1 | (B1&~C1) | (~B1&C1) | (C1&~D1);
	
endmodule
	