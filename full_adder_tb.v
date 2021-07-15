/*

full adder test bench 

*/

module full_adder_tb;

reg a,b,cin;
wire sum,carry;

full_adder DUT(.a(a), .b(b), .cin(cin),.carry(carry), .sum(sum));

initial begin

a = 1'b0;
b = 1'b0;
cin = 1'b0;

end

integer i;

initial begin
for( i = 0; i < 8 ;i=i+1) begin
	{a,b,cin} = i;
	#100;
	
end
end

initial $monitor(" A = %d , B = %d , Cin = %d \n Sum = %d , Carry = %d ", a,b,cin,sum,carry);

initial #1000 $finish;


endmodule
