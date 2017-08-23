module part5 (SW, LEDR, HEX0, HEX1, HEX2);
	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0, HEX1, HEX2;
	
	wire[1:0] M0, M1, M2;
	
	mux_2bit_3to1(SW[9:8], SW[5:4], SW[3:2], SW[1:0], M0);
	mux_2bit_3to1(SW[9:8], SW[3:2], SW[1:0], SW[5:4], M1);
	mux_2bit_3to1(SW[9:8], SW[1:0], SW[5:4], SW[3:2], M2);
	
	char_7seg (M2, HEX0);
	char_7seg (M1, HEX1);
	char_7seg (M0, HEX2);
	
	assign LEDR = SW;
endmodule

module mux_2bit_3to1(Srev,U,V,W,M);
	input [0:1]Srev,U,V,W;
	wire [0:1] S, Mj;
	output [1:0] M;
	
	assign S = {Srev[1], Srev[0]};
	
	assign Mj = {~S[0]&~S[1], ~S[0]&~S[1]} & U | {S[0]&~S[1], S[0]&~S[1]} & V | {S[1], S[1]} & W;
	assign M = {Mj[1], Mj[0]};
endmodule


module char_7seg(C, Display);
	input [0:1]C;
	output [0:6]Display;
	wire c1, c0;
	
	assign c1 = C[1];
	assign c0 = C[0];
	
	assign Display[0] = ~(~c1 & c0); 
	assign Display[1] = c0;
	assign Display[2] = c0;
	assign Display[3] = c1;
	assign Display[4] = c1;
	assign Display[5] = ~(~c1 & c0);
	assign Display[6] = c1;
endmodule
