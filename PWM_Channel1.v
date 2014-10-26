module PWM(
    input clk25M,
    input [87:0]byte_data_received,
    output PWM_out,
	 output PWM_out2, //добавляем второй канал
	 output PWM_out3, //добавляем третий канал
    output PWM_out4, //добавляем четвертый канал
	 output PWM_out5, //добавляем пятый канал
	 output PWM_out6, //добавляем шестой канал
	 output PWM_out7, //добавляем седьмой канал
	 output PWM_out8, //добавляем восьмой канал
	 output PWM_out9, //добавляем девятый канал
	 output PWM_out_vent //добавляем десятый канал вентиляции вытяжки
	 );

//reg [7:0] PWM_Chanel;
reg [7:0] cnt;
always @(posedge clk25M) begin 
cnt <= cnt + 1'b1;  // free-running counter

//PWM_Chanel=byte_data_received[15:8]; //зависит от температуры первого канала
//PWM_Chanel=byte_data_received[7:0];
end
assign PWM_out = ((byte_data_received[15:8])>cnt);  // comparator
assign PWM_out2 = ((byte_data_received[23:16])>cnt); //добавляем второй канал
assign PWM_out3 = ((byte_data_received[31:24])>cnt); //добавляем третий канал
assign PWM_out4 = ((byte_data_received[39:32])>cnt); //добавляем четвертый канал
assign PWM_out5 = ((byte_data_received[47:40])>cnt); //добавляем пятый канал
assign PWM_out6 = ((byte_data_received[55:48])>cnt); //добавляем шестой канал
assign PWM_out7 = ((byte_data_received[63:56])>cnt); //добавляем седьмой канал
assign PWM_out8 = ((byte_data_received[71:64])>cnt); //добавляем восьмой канал
assign PWM_out9 = ((byte_data_received[79:72])>cnt); //добавляем девятый канал
assign PWM_out_vent = ((byte_data_received[87:80])>cnt); //добавляем десятый канал вентиляции вытяжки
endmodule