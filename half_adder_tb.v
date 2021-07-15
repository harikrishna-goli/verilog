/*

Half adder test bench 

*/

module half_adder_tb;

reg a,b;
wire sum,carry;

half_adder DUT(.a(a), .b(b), .carry(carry), .sum(sum));

initial begin

a = 1'b0;
b = 1'b0;

end

integer i;

initial begin
for( i = 0; i < 4 ; i= i+1) begin
	{a,b} = i;
	#200;
end
end

initial $monitor(" A = %d , B = %d \n Sum = %d , Carry = %d ", a,b,sum,carry);

initial #1000 $finish;


endmodule
