module speed_display(input wire [2:0]speed,
							output [6:0] tens,
							output [6:0] ones);
						
							
							bcd_7seg seg_tens (.num(speed), .seg_num(tens));
							
							
							
							assign ones = 7'b1000000;
							
endmodule





module bcd_7seg(
                input wire [3:0] num,
					 output reg [6:0] seg_num
					 );
					 always @(num)
				begin
				   case(num)
						 4'b0: seg_num = 7'b1000000;					 
						 4'b1: seg_num = 7'b1111001;		
						 4'b10: seg_num = 7'b0100100;
						 4'b11: seg_num = 7'b0110000;
						 4'b100: seg_num = 7'b0011001;
						 4'b101: seg_num = 7'b0010010;
						 4'b110: seg_num = 7'b0000010;
						 4'b111: seg_num = 7'b1011000;
						 4'b1000: seg_num = 7'b0000000;
						 4'b1001: seg_num = 7'b0011000;
						 4'b1010: seg_num = 7'b0001000;					 
						 4'b1011: seg_num = 7'b0000011;		
						 4'b1100: seg_num = 7'b0100110;
						 4'b1101: seg_num = 7'b0010001;
						 4'b1110: seg_num = 7'b0000110;
						 4'b1111: seg_num = 7'b0001110;
						default:  seg_num = 7'b1000000;
						endcase
				end
endmodule 
							
							
							