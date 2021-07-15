/* two input or gate
		  ---------
      A--------->|	   |
		 |    OR   |---------> out	
      B--------->|         |
		  ---------

Truth table

	A	B	out

	0	0	0
	0	1	1
	1	0	1
	1	1	1

*/

module or_2x1(
		input a,
		input b,
		output out);

assign out = a | b;

endmodule
