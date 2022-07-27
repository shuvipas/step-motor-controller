module top_motor_controller(
                            input wire rst,
									 input wire clk,
									 input wire change,
									 input wire mode,
									 input wire move,
									 input wire direction,
									 input wire step_size,
									 output wire [3:0] phase_out,
									 output wire [6:0] ones,
									 output wire [6:0] tens
									 );
									 
									 //internal wires
									 wire [2:0] speed;
									 wire pulse;
									 wire zero_state;
									 
									 step_motor_controller smc_inst(.change(change), .rst(rst), .clk(clk), .speed(speed));
									 
									 step_motor_speed sms(.speed(speed), .rst(rst), .clk(clk), .step_pulse(pulse));
									 
									 speed_display sd(.speed(speed), .ones(ones), .tens(tens));
									 
									 step_motor_mode smm(.rst(rst), .mode(mode), .move(move), .pulse(pulse), .zero_state(zero_state));
									 
									 driver_controller dc(.rst(rst), .step_pulse(pulse), .direction(direction), .step_size(step_size), .zero_state(zero_state), .phase_out(phase_out));
									 
									 
									 endmodule
									 
									 
									 
									 
									 