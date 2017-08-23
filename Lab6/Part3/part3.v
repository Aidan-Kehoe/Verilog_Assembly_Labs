
module part3(SW, KEY, CLOCK_50, LEDR);
	input [2:0]SW;
	input [1:0]KEY;
	input CLOCK_50;
	output [0:0]LEDR;
	wire [3:0]output_length, output_type;
	
	letter_selector (SW, output_length, output_type);
endmodule
	
module T_FF(input T, clock, resetn, output reg Q);
	always @ (negedge resetn, posedge clock)
		if (~resetn)
			Q <= 1'b0;
		else if (T)
			Q <= ~Q;
endmodule

module letter_selector(S, output_length, output_type);
	input [2:0] S; 
	output reg [3:0] output_length;
	output reg [3:0] output_type;
	parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;

	always @(S[2:0])
	begin
		case(S[2:0])
			A: begin
				output_length[3:0] = 4'b0010;
				output_type[3:0] = 4'b01xx;
				end
			B: begin
				output_length = 4'b0100;
				output_type = 4'b1000;
				end
			C: begin
				output_length = 4'b0100;
				output_type = 4'b1010;
				end
			D: begin
				output_length = 4'b0011;
				output_type = 4'b100x;
				end
			E: begin
				output_length = 4'b0001;
				output_type = 4'b0xxx;
				end
			F: begin
				output_length = 4'b0100;
				output_type = 4'b0010;
				end
			G: begin	
				output_length = 4'b0011;
				output_type = 4'b110x;
				end
			H: begin	
				output_length = 4'b0100;
				output_type = 4'b0000;
				end
			default: begin
				output_length = 4'bxxxx;
				output_type = 4'bxxxx;
				end
		endcase
	end
endmodule
