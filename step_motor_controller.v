

module step_motor_controller( 
								input wire change,//key 3- increase/decrease the motor speed
								input wire rst,
								input wire clk,//50MHz
								output wire [2:0]speed
								);
								
								//State definition
								parameter start = 3'b001,
											 s20 = 3'b010,
											 s30 = 3'b011,
											 s40 = 3'b100,
											 s50 = 3'b101,
											 s60 = 3'b110;
								
								reg change_o;
								reg[2:0]cs;
								reg[2:0]ns;
								reg faster = 1'b1;// If key 3 makes the motor faster or slower 
								
								
								always  @(posedge clk)
									begin
									change_o <= change;
									end
								
								//every clock insert ns to cs
								
								always @(posedge change_o or negedge rst) 
									begin
										if (~rst)
											begin
											cs <= start;
											faster <= 1'b1;
											end
										else
											begin
											cs <= ns;
											
											if (cs == start)
												begin
												faster <= 1'b1;
												end
											
											if (cs == s60)
												begin
												faster <= 1'b0;
												end
											end	
											
									end
			
								//Next state logic	
								
								always @(cs)//Will actevaite when cs or the in change
									begin
										case (cs)
													   start: ns = s20;
														s20: ns = faster ? s30 : start;
														s30: ns = faster ? s40 : s20;
														s40: ns = faster ? s50 : s30;
														s50: ns = faster ? s60 : s40;
														s60: ns = s50;
														default: ns = start;
														endcase
											
											end
							assign speed = cs;
			
endmodule
