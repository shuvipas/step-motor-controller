module step_motor_mode(
								input wire rst,
								input wire mode,//sw2: 0 for quadrater cycle, 1 for continous 
								input wire move, //key1 = move quadrater cycle
								input wire pulse,
								output reg zero_state
								);
								
								reg [6:0] num2count;
								reg new_pressed;
								always @(posedge pulse or negedge rst)
									begin
									if(~rst)
									begin
										new_pressed <= 1'b1;
										num2count <= 7'h0;
									end
									
									else if (mode == 1'b1)
										begin
										zero_state <= 1'b0;
										end
										
									else 
										begin 
										if(~move & new_pressed)
											begin
											new_pressed <= 1'b0;
											
											if(num2count == 7'h0)
												
												num2count <= 7'h64; //100 in decimal basis
													
											end
										else if (move)
											new_pressed <= 1'b1;
										
										if (num2count > 7'h0)
											begin
											num2count <= num2count - 7'h1;
											
											zero_state <= 1'b0;
											end
											
										else if(num2count == 7'h0)
											zero_state <= 1'b1; 
										
										end
									end
								
								
								endmodule 
											
													
								  
								  