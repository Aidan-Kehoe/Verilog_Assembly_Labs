//module part1(D, Clock, Q);
//	input D, Clock;
//	output Q;
//	d_latch (D, Clock, Q);
//endmodule
//module d_latch (D, Clock, Q);
//	input D, Clock;
//	output reg Q;
//	
//	always@(D, Clock)
//		if(Clock)
//			Q = D;
//			
//endmodule
//
//module posflipflop(D, Clock, Q);
//	input D, Clock;
//	output reg Q;
//	
//	always @(posedge Clock)
//		Q = D;
//		
//endmodule
//
//module negflipflop(D, Clock, Q);
//	input D, Clock; 
//	output reg Q;
//	
//	always@(negedge Clock)
//		Q = D;
//		
//endmodule



module part1 (D, Clock, Qa, Qb, Qc);
	input D, Clock;
	output Qa, Qb, Qc;
	wire Q_temp1, Q_temp2, Q_temp3;
	
	gatedD(D, Clock, Q_temp1);
	p_e_D(D, Clock, Q_temp2);
	n_e_D(D, Clock, Q_temp3);
	assign Qa = Q_temp1;
	assign Qb = Q_temp2;
	assign Qc = Q_temp3;
	
endmodule

module gatedD(D1, Clock1, Q1);
	input D1, Clock1;
	output reg Q1;
	always @(D1, Clock1)
		if(Clock1)
			Q1 = D1;
			
endmodule

module p_e_D(D2, Clock2, Q2);
	input D2, Clock2;
	output reg Q2;
	
	always @(posedge Clock2)
		Q2 = D2;
		
endmodule

module n_e_D(D3, Clock3, Q3);
	input D3, Clock3;
	output reg Q3;
	
	always @(negedge Clock3)
		Q3 = D3;
		
endmodule
