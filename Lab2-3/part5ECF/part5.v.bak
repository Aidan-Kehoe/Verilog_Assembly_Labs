module part5 (SW, LEDR, HEX0);
	input [9:0]SW;
	output [9:0]LEDR;
	output [0:6]HEX0;
	
	wire[1:0]M0;
	
	mux_2bit_3to1_1(SW[9:8], SW[5:4], SW[3:2], SW[1:0], M0);
	char_7seg1 (M0, HEX0);
endmodule



module part5_1 (SW, LEDR, HEX1);
	input [9:0]SW;
	output [9:0]LEDR;
	output [0:6]HEX1;
	
	wire[1:0]M1;
	
	mux_2bit_3to1_1(SW[9:8], SW[5:4], SW[3:2], SW[1:0], M1);
	char_7seg1 (M1, HEX1);
endmodule



module part5_2 (SW, LEDR, HEX2);
	input [9:0]SW;
	output [9:0]LEDR;
	output [0:6]HEX2;
	
	wire[1:0]M2;
	
	mux_2bit_3to1_1(SW[9:8], SW[5:4], SW[3:2], SW[1:0], M2);
	char_7seg1 (M2, HEX2);
endmodule




module mux_2bit_3to1_1(S,U,V,W,M);
	input [1:0]S,U,V,W;
	output [1:0]M;
	
	assign M = {~S[0]&~S[1], ~S[0]&~S[1]} & U | {S[0]&~S[1], S[0]&~S[1]} & V | {S[1], S[1]} & W;
endmodule
	
	
	
module mux_2bit_3to1_2(S,U,V,W,M);
	input [1:0]S,U,V,W;
	output [1:0]M;
	
	assign M = {~S[0]&~S[1], ~S[0]&~S[1]} & U | {S[0]&~S[1], S[0]&~S[1]} & V | {S[1], S[1]} & W;
endmodule



module mux_2bit_3to1_1(S,U,V,W,M);
	input [1:0]S,U,V,W;
	output [1:0]M;
	
	assign M = {~S[0]&~S[1], ~S[0]&~S[1]} & U | {S[0]&~S[1], S[0]&~S[1]} & V | {S[1], S[1]} & W;
endmodule


module char_7seg1(C, Display);
	input [0:1]C;
	output [0:6]Display;
	wire c1, c0;
	
	assign c1 = C[1];
	assign c0 = C[0];
	
	assign Display[0] = ~c1 & c0; 
	assign Display[1] = ~c0;
	assign Display[2] = ~c0;
	assign Display[3] = ~c1;
	assign Display[4] = ~c1;
	assign Display[5] = ~c1 & c0;
	assign Display[6] = ~c1;
endmodule



module char_7seg2(C, Display);
	input [0:1]C;
	output [0:6]Display;
	wire c1, c0;
	
	assign c1 = C[1];
	assign c0 = C[0];
	
	assign Display[0] = ~c1 & c0; 
	assign Display[1] = ~c0;
	assign Display[2] = ~c0;
	assign Display[3] = ~c1;
	assign Display[4] = ~c1;
	assign Display[5] = ~c1 & c0;
	assign Display[6] = ~c1;
endmodule



module char_7seg3(C, Display);
	input [0:1]C;
	output [0:6]Display;
	wire c1, c0;
	
	assign c1 = C[1];
	assign c0 = C[0];
	
	assign Display[0] = ~c1 & c0; 
	assign Display[1] = ~c0;
	assign Display[2] = ~c0;
	assign Display[3] = ~c1;
	assign Display[4] = ~c1;
	assign Display[5] = ~c1 & c0;
	assign Display[6] = ~c1;
endmodule