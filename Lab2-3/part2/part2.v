module part2(SW, LEDR);
	input [0:9] SW;
	output [0:9] LEDR;
	
	wire s;
	wire [0:3] M, X, Y;
	assign s = SW[9];
	assign X = SW[0:3];
	assign Y = SW[4:7];
	
	assign M = (~{s,s,s,s} & X) | ({s,s,s,s} & Y);
	
	assign LEDR[0:3] = M;
endmodule
