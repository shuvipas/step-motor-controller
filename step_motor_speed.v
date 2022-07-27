
module step_motor_speed(
								input wire [2:0]speed,
								input wire clk,
								input wire rst,
								//output reg [19:0] num_to_pulse);
								output wire step_pulse);
								
								reg [19:0] num_to_pulse; 
								always @(speed)
										begin										
										case(speed)
											3'b001: num_to_pulse = 20'hB5B8D8;// counts until 375000
										   3'b010: num_to_pulse = 20'h2DC6C;// counts until 187500
								         3'b011: num_to_pulse = 20'h1E848;// counts until 125000
										   3'b100: num_to_pulse = 20'h16E36;// counts until 93750
							         	3'b101: num_to_pulse = 20'h124F8;// counts until 75000
										   3'b110: num_to_pulse = 20'hF424;// counts until 62500
											default num_to_pulse = 20'hB5B8D8;// counts until 375000

										endcase
									end
counter counter_inst(.clk(clk), .rst(rst), .num_to_pulse(num_to_pulse), .step_pulse(step_pulse));
endmodule								
								
								
module counter(
					input wire clk,
					input wire rst,
					input wire [19:0]num_to_pulse,
					output reg step_pulse);
					
					reg [19:0]count;
					
					always @(posedge clk or negedge rst)
					begin
						if(~rst)
							begin
							count <= 20'h0;
							step_pulse<= 1'b0;
							end
						else
							begin
							count <= count + 1'h1;
							if (count >= num_to_pulse)
										begin
										count <= 20'h0;
										step_pulse = ~step_pulse;//step_pulse<= 1'b1;
										end
						//	else 
								//		step_pulse<= 1'b0;
							end
					
					end
					
endmodule 