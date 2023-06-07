module blink(
	input wire clk,
	input wire rst,
	output reg led1,
	output reg led2,
	output reg led3,
	output reg led4
);

reg [24:0] counter;
reg [1:0] state;

always @(posedge clk) begin
	if (counter == 25'd2500000) begin
		counter <= 0;
		state <= state + 1;
	end
	else
		counter <= counter + 1;
end
always @(posedge clk)begin
	if (rst) begin
		led1 <= 1'b0;
		led2 <= 1'b0;
		led3 <= 1'b0;
		led4 <= 1'b0;
	end
end

always @(posedge clk) begin
	case(state)
		2'b00: begin
			led1 <= 1'b1;		
			led2 <= 1'b0;
			led3 <= 1'b0;
			led4 <= 1'b0;
		end
		2'b01: begin	
		        led1 <= 1'b0;		
		        led2 <= 1'b1;
		        led3 <= 1'b0;
		        led4 <= 1'b0;

	       end
	       2'b10: begin
		       led1 <= 1'b0;		
		       led2 <= 1'b0;
		       led3 <= 1'b1;
		       led4 <= 1'b0;
	       end
	       2'b11: begin
		       led1 <= 1'b0;		
		       led2 <= 1'b0;
		       led3 <= 1'b0;
		       led4 <= 1'b1;
	       end
	       default: state <= 1'b0;
endcase
end

endmodule






