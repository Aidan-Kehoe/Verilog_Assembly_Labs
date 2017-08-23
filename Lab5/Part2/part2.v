module part2(SW, KEY1, KEY0, HEX3, HEX2, HEX1, HEX0);
	input [9:0] SW;
	input KEY1, KEY0; 
	output [6:0] HEX3, HEX2, HEX1, HEX0
	wire reg [7:0] temp, temp2, A;
	wire [7:0] h_temp, h_temp2;
	
	
	always @(negedge KEY0, posedge KEY1)
		if(!KEY0)
			temp = SW[7:0];
		else
			temp2 = SW[7:0]
			
	ripplemod(temp, temp2, SW[8], A, LED0);
	
	always @(*)
		if A > 8'd9
			h_temp2 = sum - 8'd10
			
	
endmodule

module ripplemod(a, b, cin, sum, cout);
	input [7:0] a;
	input [7:0] b;
	input cin;
	output [7:0]sum;
	output cout;
	wire[6:0] c;
	
	fulladd a1(a[0],b[0],cin,sum[0],c[0]);
	fulladd a2(a[1],b[1],c[0],sum[1],c[1]);
	fulladd a3(a[2],b[2],c[1],sum[2],c[2]);
	fulladd a4(a[3],b[3],c[2],sum[3],c[3]);
	fulladd a5(a[4],b[4],c[3],sum[4],c[4]);
	fulladd a6(a[5],b[5],c[4],sum[5],c[5]);
	fulladd a7(a[6],b[6],c[5],sum[6],c[6]);
	fulladd a8(a[7],b[7],c[6],sum[7],cout);
endmodule		
	
module fulladd(a, b, cin, sum, cout);
	input a;
	input b;
	input cin;
	output sum;
	output cout;
	assign sum=(a^b^cin);
	assign cout=((a&b)|(b&cin)|(a&cin));
endmodule

module seg7 (IN, OUT);
	input [3:0] IN;
	output [6:0] OUT;

	wire A, B, C, D;
	assign A = IN[3];
	assign B = IN[2];
	assign C = IN[1];
	assign D = IN[0];

	assign OUT[0] = ~(A | C | (B&D) | (~B&~D));
	assign OUT[1] = ~(~B | (~C&~D) | (C&D));
	assign OUT[2] = ~(B | ~C | D);
	assign OUT[3] = ~((~B&~D) | (C&~D) | (B&~C&D) | (~B&C) | A);
	assign OUT[4] = ~((~B&~D) | (C&~D));
	assign OUT[5] = ~(A | (~C&~D) | (B&~C) | (B&~D));
	assign OUT[6] = ~(A | (B&~C) | (~B&C) | (C&~D));
endmodule
	