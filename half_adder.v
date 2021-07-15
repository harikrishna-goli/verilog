/* Design of the half adder circuit
		  ---------
      A--------->|	   |---------> Sum
		 |    HA   |
      B--------->|         |---------> carry	
		  ---------

Inputs A and B 
Ouputs Sum and Carry

Half adder Truth table

		A	B	Sum	Carry
		
		0	0	0	0
		0	1	1	0
		1	0	1	0
		1	1	0	1
*/

module half_adder(	input a,
			input b,
			output sum,
			output carry);
assign sum = a ^ b;
assign carry = a & b;

endmodule