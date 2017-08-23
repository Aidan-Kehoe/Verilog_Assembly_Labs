module part3_1(SW,KEY,CLOCK_50,LEDR,LEDG);
	input [2:0] SW; // for letter selection
	input [1:0] KEY; // Start & Asynchronous ResetN
	input CLOCK_50; // 50MHz clock
	output [0:0] LEDR; // Outputs Morse Code 
	output [2:0] LEDG;	//used to test states
	
	reg [25:0] count;	//counts 50 MHz clock signals to 0.5 seconds 
	reg [2:0] length;	//morse code length  (from 1-4)
	reg [2:0] counter;	//morse code length counter (from 1-4)
	reg [3:0] M;	//morse code, 1 = dash, 0 = dot
	reg [3:0] Q;	//shift register outputs, Q[3] is the input to the FSM
	reg z;			//output to ledr
	
	reg[2:0] y_Q, Y_D;	//y_Q represents current state, Y_D represents next state
	// Letter representation of SW[2:0] input  

	parameter WA = 3'b000, WB = 3'b001, WC = 3'b010, WD = 3'b011, WE = 3'b100, WF = 3'b101, WG = 3'b110, WH = 3'b111;
	// States using minimum state encoding 
	parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100; 
		
	assign LEDR[0] = z;
	//Letter_Selection_Module
	always @(SW[2:0]) // anytime user changes his selection, reset length of word and its output form 
	begin: letter_selection
		case(SW[2:0])
//morse code, 1 = dash, 0 = dot
			WA: begin
					length = 3'b010;
					M = 4'b0100;
				end
			WB: begin
					length = 3'b100;
					M = 4'b1000;
				end
			WC: begin
					length = 3'b100;
					M = 4'b1010;
				end
			WD: begin
					length = 3'b011;
					M = 4'b1000;
				end
			WE: begin
					length = 3'b001;
					M = 4'b0000;
				end
			WF: begin
					length = 3'b100;
					M = 4'b0010;
				end
			WG: begin
					length = 3'b011;
					M = 4'b1100;
				end
			WH: begin
					length = 3'b100;
					M = 4'b0000;
				end
		endcase
	end	//letter_selection
	
//State Table
	// anytime register changes shift output, reset/start is pressed, 
	// when counter decrements cause 1 symbol is shown or current state changes 
	always @(Q[3], KEY[1:0], counter, y_Q) 
													
	begin: state_table
		case (y_Q)
			// State A = Idle State 
			A: if (KEY[1]) Y_D = B; // if start is pressed, go to state B 
				else Y_D = A; // else, remain idle at state A 
			// State B => State Selection State  
			B: if (!Q[3]) Y_D = E; // if next Symbol is 0, go to state E (outputs 0.5sec)
				else Y_D = C; // if next Symbol is 1, go to state C (outputs 0.5sec)
			// B -> C -> D -> => 1.5 seconds => dash 
			C: if (KEY[0]) Y_D = A; // as long as reset is pressed, go to state A
				else Y_D = D;			// else, go to state D
			D: if (KEY[0]) Y_D = A; // as long as reset is pressed, go to state A
				else Y_D = E;			// else, go to state E 
			// B -> E 			 => 0.5 seconds => dot // the transition turns on LED for 0.5 seconds 
			E: if (counter == 0) Y_D = A; // if counter is 0, no more symbols, go to state A
				else Y_D = B;					// else, go to state B 
		default: Y_D = 3'bxxx; // In case of weird behaviour 
		endcase
	end	//state table
	
	//clock counter
	always @(posedge CLOCK_50)
	begin
		if (count < 50000000/2) // at every 0.5 seconds, activate  
			count <= count + 1;
		else
		begin
			count <= 0;
			y_Q <= Y_D; // go to next state 
			if (Y_D == A) begin // if next state is A, update counter to length and pattern to M 
				counter <= length;
				Q <= M;
			end
			if (Y_D == E) begin    // if state E 
				counter <= counter - 1; // deduct counter 
				// Shift pattern 
				Q[3] <= Q[2];
				Q[2] <= Q[1]; 
				Q[1] <= Q[0];
				Q[0] <= 1'b0;
			end
		end
	end
	// LED output based on current state 
	always @(y_Q)
	begin: zassign
		case (y_Q)
			B: z = 1; // turn on output 
			C: z = 1; // turn on output 
			D: z = 1; // turn on output 
			default: z = 0; // off output at States E or A 
		endcase
	end
endmodule 