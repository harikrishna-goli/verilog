/*

Question :

	Design the ALU for the given specification given below

Here the ALU has two  8 bit inputs , 1 bit enable oe and 4 bit command and the output is 16 bit 

Here the low MSB perform the Arithmetic operations and High MSB perform Logical operations

		 ---------------
	en----->|		|
		|		|
command	--/---->|		|
	4 bit	|		|
		|		|		16 bit
		|		|----------------/----> y
		|		|
		|		|
       a --/--->|		|
	8 bit	|		|
		|		|
       b---/--->|		|
	8 bit	 ---------------



			Command			Operation
			
			0000			Add a and b
			0001			Increment a
			0010			Subtract b and c
			0011			Decrement a by 1
			0100			Multiply a and b
			0101			Divide a by b
			0110			shift a right by 1
			0111			shift a left by 1
			1000			And a,b
			1001			or a,b
			1010			Invert a
			1011			Nand a and b
			1100			Nor a and b
			1101			Xor a and b
			1110			Xnor a,b			
			1111			Buffer a


*/


module alu(a,b,command,en,y);
input [0:7] a,b;
input en;
input [0:3] command;
output [0:15] y;
reg[0:15] out;


 parameter  ADD  = 4'b0000, 
            INC  = 4'b0001,
            SUB  = 4'b0010, 
            DEC  = 4'b0011, 
            MUL  = 4'b0100, 
            DIV  = 4'b0101, 
            SHR  = 4'b0110, 
            SHL  = 4'b0111, 
            AND  = 4'b1000, 
            OR   = 4'b1001, 
            INV  = 4'b1010, 
            NAND = 4'b1011, 
            NOR  = 4'b1100, 
            XOR  = 4'b1101, 
            XNOR = 4'b1110, 
            BUF  = 4'b1111; 

always@(command)
	begin
		case(command)
	    ADD: 	out = a + b;
            INC: 	out = a + 1;
            SUB: 	out = b - a;
            DEC: 	out = a - 1;
            MUL:	out = a * b; 
            DIV:	out = a / b; 
            SHL:	out = a << 1; 
            SHR:	out = a >> 1;	 
            AND:	out = a & b; 
            OR :	out = a | b;
            INV :	out = ~a;
            NAND :	out = ~(a&b);
            NOR :	out = ~(a|b);
            XOR :	out = a ^ b;
            XNOR :	out = ~(a ^ b);
            BUF :	out = a;
endcase

end

assign y = (en) ? out:16'hzzzz;

endmodule


