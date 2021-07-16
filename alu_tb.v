/*

This is the testbench for the given problem

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

module alu_tb();
   
  reg [7:0]  a,b;
  reg [3:0]  command;
  reg enable;
  wire [15:0] y;

  integer m,n,o;

  parameter ADD  = 4'b0000, 
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

  reg [(8*8)-1:0] string_cmd;


  alu DUT(.a(a),.b(b),.command(command),.en(enable),.y(y));


  task initialize;
  begin
   {a,b,command,enable}=0;
  end
  endtask

  task en_oe(input i);
  begin
    enable=i;
  end
  endtask
  
  task inputs(input [7:0] j,k);
  begin
    a=j;
    b=k;
  end
  endtask
  
  task cmd (input [3:0] l);
  begin
    command=l;
  end
  endtask

  task delay();
  begin
    #10;
  end
  endtask
 
  always@(command)
  begin
    case (command)
      ADD   :  string_cmd = "ADD";
      INC   :  string_cmd = "INC";
      SUB   :  string_cmd = "SUB";
      DEC   :  string_cmd = "DEC";
      MUL   :  string_cmd = "MUL";
      DIV   :  string_cmd = "DIV";
      SHR   :  string_cmd = "SHR";
      SHL   :  string_cmd = "SHL";
      AND   :  string_cmd = "AND";
      OR    :  string_cmd = "OR";
      INV   :  string_cmd = "INV";
      NAND  :  string_cmd = "NAND";
      NOR   :  string_cmd = "NOR";
      XOR   :  string_cmd = "XOR";
      XNOR  :  string_cmd = "XNOR";
      BUF   :  string_cmd = "BUF";
    endcase
  end

  initial
  begin
    initialize;
    en_oe(1'b1);
    for (m=0;m<256;m=m+1)
    begin
      for (n=0;n<256;n=n+1)
      begin
        inputs(m,n);
        for (o=0;o<16;o=o+1)
        begin
          command=o;
          delay;
        end 
      end
    end

    en_oe(0);
    inputs(8'd20,8'd10);
    cmd(ADD);
    delay;
    en_oe(1);
    inputs(8'd25,8'd17);
    cmd(ADD);
    delay;
    
    $finish;
  end

  initial $monitor("Input oe=%b, a=%b, b=%b, command=%s, Output y=%b",
                  enable,a,b,string_cmd,y);

endmodule
