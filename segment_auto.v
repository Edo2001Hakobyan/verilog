module segment(
	input wire clk,
	input wire rst,
	output reg [6:0]  segment
);

reg [24:0] counter;
reg [3:0] number;

always @(posedge clk) begin
	if (rst) begin
		number <= 4'b0000;
		segment <= 7'b1111111;
	end
	else if(counter == 25'd2500000) begin
		counter <= 0;
		number <= number + 4'b0001;
		if(number == 4'b1001)
			number <= 4'b0000;
		else
			counter <= counter + 1;
	end
end

always @(posedge clk) begin
	case(number) 
		4'b0000: segment <= 7'b0000001;
		4'b0001: segment <= 7'b1001111;
		4'b0010: segment <= 7'b0010010;
		4'b0011: segment <= 7'b0000110;
		4'b0100: segment <= 7'b1001100;
		4'b0101: segment <= 7'b0100100;
		4'b0110: segment <= 7'b0100000;
		4'b0111: segment <= 7'b0001111;
		4'b1000: segment <= 7'b0000000;
		4'b1001: segment <= 7'b0000100;
		default: segment <= 7'b1111111;
	endcase
end
endmodule


