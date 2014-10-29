module Humidity (clk1M,Data_H,flag_five_sec,HYM2, mstate,gorb);
input clk1M;
inout wire Data_H; // линия данных датчика влажности
reg Data_H_REG;
//output clk1M_out; //такт 1мкс
input wire flag_five_sec; // линия на которой строб с 5 сек периодом
reg [15:0] shet; //счетчик метроном приветствия
reg [2:0] protocol; //регистр для детектирования 5 сек отсчета
reg[2:0] data_rec; // регистр для детектирования спада и подъема линии данных при передаче от датчика в плис
reg[5:0] id_gorb; //номер принятого горба
reg [39:0]HYM; // регистр для хранения данных от датчика
output reg [39:0]HYM2; //регистр передачи значения датчика наружу блока оконечный
output reg [2:0] mstate; // стейт 0-ждем фронт 5 сек, стейт 1 - отправляем приветствие, стейт 2 - читаем ответ
reg Data_H_write;
output reg gorb;
//output reg Data_H_test;

initial begin
	shet<=0; //счетчик метроном приветствия
	Data_H_REG<=1'b0;
	mstate<=0;
	protocol<=3'b000;
	data_rec<=3'b000;
	Data_H_write<=0;
	gorb<=0;
	//Data_H_test=0;
end

assign Data_H = (Data_H_write==1) ? Data_H_REG : 1'bz;

always @(posedge clk1M) protocol <= {protocol[1:0], flag_five_sec};
wire FFS_risingedge = (protocol[2:1]==2'b01);  // now we can detect flag_five_sec rising edges
wire FSDR_risingedge=(data_rec[2:1]==2'b01); // детектируем подъем на шине данных
wire FSDR_fallingedge=(data_rec[2:1]==2'b10); // детектируем спад на шине данных

always @(posedge clk1M) begin
//Data_H_test <= Data_H;
	if(FFS_risingedge)begin
	   Data_H_write<=1;
		mstate<=1;
		Data_H_REG<=1'b0;
		shet<=0;
	end

if (mstate==1) // приветствие от плис к датчику
begin
//shet=shet+1;
	if (shet == 18000) //18мс держим шину в 0
	begin
	   shet<=shet+1'b1;
		Data_H_REG<=1'b1;
	end else if (shet==18040) // 40мкс держим шину в 1
			begin
			shet<=shet+1'b1;
			Data_H_REG<=1'b0;
		   end else	if (shet==18041)
				begin
				shet<=shet+1'b1;
			   Data_H_write<=0; // переводим шину на вход
				mstate<=2;
				shet<=0;
				end else 
					 begin
					 shet<=shet+1'b1;
					 end
				end else if (mstate==2) // тут начинаем обработку данных от датчика
							begin
							data_rec <= {data_rec[1:0], Data_H};//для детектирования спадов и подъемов на шине данных
							         if (FSDR_risingedge==1) //видим подъем на шине данных
										begin
										shet<=1'b0; // обнуляем счетчик					
										id_gorb<=id_gorb+1'b1; // присваиваем ему порядковый номер
										end else if (FSDR_fallingedge==1)//если видим спад 
																begin
																		if (id_gorb!=1 & shet>30 & shet<75) // горб не первый и длительностью похожей на 1
																			begin
																			HYM <= {HYM[38:0], 1'b1}; //заносим 1
																			gorb<=0;
																			shet<=0;
																			end else if (id_gorb!=1 & shet>10 & shet<35)// горб не первый и длительностью похожей на 0
																							begin
																							HYM <= {HYM[38:0], 1'b0}; //заносим 0
																							gorb<=1;
																							shet<=0;
																							end else if (shet>100) //в конце передачи шина встает в 1 до след передачи, смотрим этот момент
																										begin
																										shet<=0;
																										mstate<=3; //стейт в ожидание новой передачи
																										//HYM2<=HYM; // в момент окончания передачи переводим данные в регистр для передачи уже полной инфы наружу блока, данный регистр обновляется только после того как вся инфа набрана.
																										HYM2<=39'b010101010101010101000000010101010101010;
																										end else begin
																													shet<=0; //данное условие наступает если горб первый
																													end
																end else begin
																			shet<=shet+1'b1;//если нет подъема и спада - работает это условие
																			end
							end
end	

endmodule
