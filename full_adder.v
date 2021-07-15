/* Design of the Full adder circuit
		  ---------
      A--------->|	   |---------> Sum
		 |         |
      B--------->|    FA   |
		 |	   |---------> carry	
    Cin--------->|         |
		  ---------

Inputs A and B and Cin
Ouputs Sum and Carry




Half adder Truth table

		A	B	Sum	Carry
		
		0	0	0	0
		0	1	1	0
		1	0	1	0
		1	1	0	1

Contruction of full adder using half adder

		  ---------
      A--------->|	   |---------> Sum(W)
		 |    HA   |
      B--------->|         |---------> carry(x)	
		  ---------

		  ---------
    Cin--------->|	   |---------> Sum
		 |    HA   |
      W--------->|         |---------> carry(y)	
		  ---------

		  ---------
      x--------->|	   |
		 |    OR   |---------> carry	
      y--------->|         |
		  ---------


*/


module full_adder(	input a,
			input b,
			input cin,
			output sum,carry);

wire w ,x ,y;

half_adder	HA1 ( .a(a), .b(b) , .sum(w) , .carry(x));
half_adder	HA2 ( .a(cin) , .b(w) , .sum(sum) , .carry(y));
or_2x1		OR(.a(x) , .b(y) , .out(carry));

endmodule