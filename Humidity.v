module Humidity (clk1M,Data_H,flag_five_sec,HYM2, Data_H_test);
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
reg [2:0] mstate; // стейт 0-ждем фронт 5 сек, стейт 1 - отправляем приветствие, стейт 2 - читаем ответ
reg Data_H_write;
//output reg gorb;
output reg Data_H_test;

initial begin
	shet<=16'b0; //счетчик метроном приветствия
	Data_H_REG<=1'b0;
	mstate<=3'b0;
	protocol<=3'b000;
	data_rec<=3'b000;
	Data_H_write<=0;
	id_gorb<=6'b000000;
	Data_H_test<=0;
	HYM<=40'b0;
	HYM2<=40'b0;
end

assign Data_H = (Data_H_write==1) ? Data_H_REG : 1'bz;

always @(posedge clk1M) protocol <= {protocol[1:0], flag_five_sec};
wire FFS_risingedge = (protocol[2:1]==2'b01);  // now we can detect flag_five_sec rising edges
wire FSDR_risingedge=(data_rec[2:1]==2'b01); // детектируем подъем на шине данных
wire FSDR_fallingedge=(data_rec[2:1]==2'b10); // детектируем спад на шине данных

always @(posedge clk1M) begin
	Data_H_test <= Data_H;
end

always @(posedge clk1M) begin
	if(FFS_risingedge)begin
	   Data_H_write <= 1;
		Data_H_REG   <= 1'b0;
		shet<=16'd0;
		id_gorb<=6'b000000;
		HYM  <= 40'b0;
		HYM2 <= 40'b0;
	end else begin
		if (mstate==1) begin// приветствие от плис к датчику
		
			if (shet == 18000) begin //18мс держим шину в 0
				shet<=shet+1'b1;
				Data_H_REG<=1'b1;
			end else if (shet==18040) begin // 40мкс держим шину в 1
				shet<=shet+1'b1;
				Data_H_REG<=1'b0;
			end else	if (shet==18041) begin
				shet<=16'd0;
				Data_H_write<=0; // переводим шину на вход
			end else begin
				shet<=shet+1'b1;
			end
						 
		end else if (mstate==2) begin // тут начинаем обработку данных от датчика
			
			shet<=shet+1'b1;//если нет подъема и спада - работает это условие
			data_rec <= {data_rec[1:0], Data_H};//для детектирования спадов и подъемов на шине данных
			
			if (FSDR_risingedge==1) begin //видим подъем на шине данных
				shet<=16'd0; // обнуляем счетчик					
				id_gorb<=id_gorb+1'b1; // присваиваем ему порядковый номер
			end else if (FSDR_fallingedge==1 & id_gorb!=1 & shet>30 & shet<75) begin //если видим спад горб не первый и длительностью похожей на 1
				shet<=16'd0;
				HYM <= {HYM[38:0], 1'b1}; //заносим 1
			end else if (FSDR_fallingedge==1 & id_gorb!=1 & shet>10 & shet<35) begin //если видим спад горб не первый и длительностью похожей на 0
				shet<=16'd0;
				HYM <= {HYM[38:0], 1'b0}; //заносим 0
			end else if (shet>100) begin //в конце передачи шина встает в 1 до след передачи, смотрим этот момент
				shet<=16'd0;
				HYM2<=HYM;//40'b1111111111111111111111111111111111111111; // в момент окончания передачи переводим данные в регистр для передачи уже полной инфы наружу блока, данный регистр обновляется только после того как вся инфа набрана.
				id_gorb<=0;
			end else if (shet>90 & id_gorb==1) begin
				shet<=16'd0;
			end
		
		end
							
	end	
	
	//код управления стейтами
	if(FFS_risingedge)begin
		mstate<=3'd01;
	end else begin
		if (mstate==1) begin // приветствие от плис к датчику
			mstate <= (shet==18041) ? 3'd02 : 3'd01;
		end else if (mstate==2) begin // тут начинаем обработку данных от датчика
			mstate <= (shet >  100) ? 3'd03 : 3'd02;
		end
	end
end

endmodule
