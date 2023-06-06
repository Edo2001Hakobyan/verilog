module Light(
	input wire clk,
	input wire rst,
	output reg light
);

reg [31:0] counter;
reg [2:0] state;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		counter <= 0;
		state <= 0;
		light <= 0;
	end
	else begin
		case (state)
			0:begin
				if(counter == 1000000) begin
					counter <= 0;
					state <= 1;
				end
				else begin
					counter <= counter + 1;
				end
			end

			1:begin
				if(counter == 2000000) begin
					counter <= 0;
					state <= 2;

				end
				else begin
					counter <= counter + 1;
				end
			end

			2:begin
				if(counter == 10000000) begin
					counter <= 0;
					state <= 3;
				end
				else begin
					counter <= counter + 1;
				end
			end	

			3:begin
				if(counter == 2000000) begin
					counter <= 0;
					state <= 4;
				end
				else begin
					counter <= counter + 1;
				end
			end	
			4:begin
				if(counter == 1000000) begin
					counter <= 0;
					state <= 0;
					light <= 0;
				end
				else begin
					counter <= counter + 1;
				end				
			end
			default:begin
			end
		endcase
	end
end


endmodule





		

