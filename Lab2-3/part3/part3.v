module part3 (SW, LEDR);
	input [9:0] SW;
	output [9:0] LEDR;
	
	wire [1:0] S, U, V, W, M;
	
	assign S = SW[9:8];
	assign U = SW[5:4];
	assign V = SW[3:2];
	assign W = SW[1:0];
	
	assign M = {~S[0]&~S[1], ~S[0]&~S[1]} & U | {S[0]&~S[1], S[0]&~S[1]} & V | {S[1], S[1]} & W;
	
	assign LEDR[1:0] = M;
endmodule
