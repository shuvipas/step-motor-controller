module driver_controller(
                         input wire rst,
								 input wire direction,//sw1: 0 for counter clockwise, 1 for clockwise 
								 input wire step_size,//sw3: 0 for half a step, 1 for a full step 
								 input wire step_pulse,// a pulse from the clock
								 input wire zero_state,
								 output reg [3:0] phase_out);
								 
								 reg [3:0] state;// the output pulse
								 reg flag;//for a full step, it will ignore evrey other cycle
								 always @(posedge step_pulse or negedge rst)
                                begin 
                                if (~rst)
											  begin 
											  state <= 4'b1;
											  flag <= 1'b0;
											  phase_out <= 4'b0000;
											  end
 
                                else  
										  begin
												  if(zero_state == 1'b1)
														begin
												      //state <= 4'b0;
														phase_out <= 4'b0000;
														flag <= 1'b1;
														end
													else
													begin
														
												  if (direction == 1'b1 & step_size == 1'b0)
												  begin
														 if (state == 4'b1000)// | (state == 4'b0000))
															begin
															state <= 4'b0001;
															end
														 else
															begin
															state <= state + 4'b0001;
															end
												  end 
												  
												  else if (direction ==1'b0 & step_size == 1'b0)
														  begin																		
																 if (state == 4'b0001)// | state == 4'b0000)
																	state <= 4'b1000;
																 else
																	state <= state - 4'b0001; 
														  end
												  else if (direction ==1'b1 & step_size == 1'b1)
														  begin
															  if (flag)
																flag <= ~flag;
															  else if (state == 4'b0111)// | state == 4'b0000)
																	begin
																	state <= 4'b0001;
																	flag <= ~flag;
																	end
															  else
																	begin
																	state <= state + 4'b010;
																	flag <= ~flag;
																	end
														 end 
												  else if (direction ==1'b0 & step_size == 1'b1)
													  begin 
														 if (flag)
																flag <= ~flag;
														 else if (state == 4'b0001)// | state == 4'b0000)
															  begin
															  state <= 4'b0111;
															  flag <= ~flag;
															  end
														  else
															  begin
															  state <= state - 4'b010;
															  flag <= ~flag;
															  end
														end 
												  case (state)
														  4'b0001: phase_out <= 4'b1000 ; 
														  4'b0010: phase_out <= 4'b1010 ; 
														  4'b0011: phase_out <= 4'b0010 ; 
														  4'b0100: phase_out <= 4'b0110 ; 
														  4'b0101: phase_out <= 4'b0100 ; 
														  4'b0110: phase_out <= 4'b0101 ; 
														  4'b0111: phase_out <= 4'b0001 ;
														  4'b1000: phase_out <= 4'b1001 ;
														  default  phase_out <= 4'b0000 ;
												  endcase
												  
												  end
												  
											end
										end
endmodule										  