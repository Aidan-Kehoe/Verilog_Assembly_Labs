module part3(SW, C, A, B);
	output [3:0] SW;
	output C;
	input [3:0] A;
	input [3:0] B;
	
	wire C0, C1, C2;
	
	fulladder(S[0], C0, A[0], B[0], 0);
	fulladder(S[1], C1, A[1], B[1], C0);
	fulladder(S[2], C2, A[2], B[2], C1);
	
endmodule

module fulladder(x, y, carry_in, sum, carry_out);
	input x;
	input y;
	input carry_in;
	output sum;
	output carry_out;
	
	assign {carry_out, sum} = carry_in + y + x;s
endmodule


