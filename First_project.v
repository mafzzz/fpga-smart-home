module First_project(input wire key0,
                     input wire clk50M,
							//input wire ZERO, // зачем оно тут, ведь концевик заведен на key0???
                     output reg led0,
                     output reg led1,
	  		            //input wire clk,
			            input wire SCK, 
			            input wire MOSI,
			            output wire MISO,
			            input wire SSEL,
                     //output wire [3:0]OUT,
							output wire [3:0]OUT_final,
							//output wire [47:0]byte_data_received, 
							output wire PWM_out,
							output wire PWM_out2, //добавляем второй канал
							output wire PWM_out3, //добавляем третий канал
                     output wire PWM_out4, //добавляем четвертый канал
							output wire PWM_out5, //добавляем пятый канал
							output wire PWM_out6, //добавляем шестой канал
							output wire PWM_out7, //добавляем седьмой канал
							output wire PWM_out8, //добавляем восьмой канал
							output wire PWM_out9, //добавляем восьмой канал
							output wire PWM_out_vent, //добавляем десятый канал вентиляции вытяжки
			            //input wire angle_target,
							//input wire dev_state,
			            //output wire clk1M_out,
							inout wire Data_H,
							output wire flag_five_sec,
							output wire Data_H_test,
							output wire [2:0] mstate
							//output wire MISO1
							     );
	  wire [39:0]HYM2;
	  wire LED;
	  wire [87:0]byte_data_received;
	  SPI_slave SPI_MODULE(clk50M, SCK, MOSI, MISO, SSEL, LED, byte_data_received,HYM2);
	  wire clk1hz,clk25M,clk1M;
	  frqdiv       FGD(clk50M,clk1hz,clk25M,clk1M); // важна последовательность объявления экземпляров?
	  wire M_EN,DIR, STEP;
	  SETPOS        STPS(key0,clk1hz,M_EN,DIR,byte_data_received);
	  RELAY         RL(clk1hz,M_EN,STEP);
	  wire [3:0] STEP_OUT;
	  stepdirdriver SDRV(STEP, DIR, STEP_OUT);
	  Energy_saver  E_s(clk1hz,M_EN,STEP_OUT,OUT_final); 
	  PWM           p_w_m(clk25M,byte_data_received,PWM_out,PWM_out2,PWM_out3,PWM_out4,PWM_out5,PWM_out6,PWM_out7,PWM_out8,PWM_out9,PWM_out_vent); 
	  Humidity      Hum(clk1M,Data_H,flag_five_sec,HYM2,mstate);
	  five_sec      F_S(clk1M,flag_five_sec);
	  
	  
always @(key0) begin
			led0 = key0;
	     	end 

		always @(clk1hz) begin
			led1 = clk1hz;
	     	end 	

endmodule