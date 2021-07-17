/*

mux_4x1 Test bench

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
module mux_4x1_tb;

reg [0:1] sel;
reg [0:3] a;
wire y;

mux_4x1 DUT (.a(a), .sel(sel), .y(y));

initial begin
	{a,sel} = 0;
	end
integer m,n;

initial begin
		
	for(m=0; m < 4 ; m= m+1) begin
		sel = m;
		for(n=0; n< 16; n=n+1) begin
			a = n;
			#5;
		end
	end
	
end
endmodule
