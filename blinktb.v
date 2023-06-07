`timescale 1 ns/1 ps

module top();



reg clk;

reg rst;

wire led1;

wire led2;

wire led3;

wire led4;



blink c(.clk(clk), .rst(rst), .led1(led1), .led2(led2), .led3(led3), .led4(led4));



initial begin

	$dumpfile("blinktb.vcd");

	$dumpvars();

end



initial begin 

	clk = 1'b0;

	rst = 1'b0;

end



always #1 clk = ~clk;



initial begin

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	#1000000000;

	$display("%d %d %d %d", led1, led2, led3, led4);

	$finish;

end



endmodule


