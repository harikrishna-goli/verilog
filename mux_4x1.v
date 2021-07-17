/*

mux_4x1

Truth Table of the multipler

		Input(A)	sel	output
		
		A3 A2 A1 A0	00	A0
		A3 A2 A1 A0	01	A1
		A3 A2 A1 A0	10	A2
		A3 A2 A1 A0	11	A3

	

		 _________
	A	|	  |
      ------/-->| 4x1 mux |------->y
	4 bit	|	  |
		 ---------	
		     |
		     | 2 bit select


*/

module mux_4x1(a,sel,y);

input [3:0] a;
input [1:0] sel;
output y;
reg y;
parameter A0 = 2'b00, A1 = 2'b01, A2 = 2'b10, A3 = 2'b11;

always@(sel)	begin
			case(sel)
				
			A0: assign y = a[0];
			A1: assign y = a[1];
			A2: assign y = a[2];
			A3: assign y = a[3];
			
			endcase
		end
endmodule






