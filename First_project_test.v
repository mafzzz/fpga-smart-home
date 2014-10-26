`timescale 1ns / 100ps
module First_project_test();
reg clk50M;

First_project mod(key0, clk50M, led0, led1, SCK, MOSI, MISO, SSEL, OUT, OUT_final,
                  PWM_out, PWM_out2, PWM_out3, PWM_out4, PWM_out5, PWM_out6, PWM_out7, PWM_out8, PWM_out9, PWM_out_vent,
						clk1M_out, Data_H, flag_five_sec);
initial
begin
 repeat (200) begin
  #10;
  clk50M <= 0;
  #10;
  clk50M <= 1;
end
end
endmodule