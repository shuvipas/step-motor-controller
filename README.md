# step motor controller
This project is part of an FPGA course at HUJI that I completed with Yosef Sokolik. We were asked to create a step motor controller. The controller had to implement the following functionality: 
1.	Determine the motor speed.  The initial speed is 10 rpm, when pressing a button on the FPGA board the speed increases by 10 rpm until it reaches 60 rpm. Each further press of the button slows down the speed by 10 rpm until reaching 10 rpm. Pressing the button again increases the speed, and so on.
2.	Show the current speed on a 7 segment display.
3.	Control the direction of the rotation.
4.	Support two operating modes: continuous operation, moving the motor a quarter turn with each button press.
5.	Determine the size of the motor steps (whole or half step).
6.	Reset the controller to 10 rpm, and stop the motor if it is in quarter turn mode. 

The full instructions for the controller are in a file named “Lab#2_Step_Motor_Controller”. I added the lab report in Hebrew that includes test simulations and explanations of the code we wrote.
