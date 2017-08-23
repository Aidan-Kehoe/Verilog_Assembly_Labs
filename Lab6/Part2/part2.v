module part2 (input [1:0]SW, input [0:0]KEY, output [9:0] LEDR);
	reg [3:0] current, next; 
	parameter 	A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100,
					F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;
	wire w;
	assign w = SW[1];

	always @(w, current)
	begin: state_table
		case (current)
			A: if (w) next = F;
				else next = B;
			B: if (w) next = F;
				else next = C;
			C: if (w) next = F;
				else next = D;
			D: if (w) next = F;
				else next = E;
			E: if (w) next = F;
				else next = E;
			F: if (w) next = G;
				else next = B;
			G: if (w) next = H;
				else next = B;
			H: if (w) next = I;
				else next = B;
			I: if (w) next = I;
				else next = B;
			default: next = 4'bxxxx;
		endcase
	end
	
	always @(posedge KEY[0])
	begin: state_FFs
		if (~SW[0])
			current <= A;
		else
			current <= next;
	end 
	
	assign LEDR[9] = (~current[3] & current[2] & ~current[1] & ~current[0]) | 
							(current[3] & ~current[2] & ~current[1] & ~current[0]);
	assign LEDR[3:0] = current;
	assign LEDR[8:4] = 5'b00000;
endmodule