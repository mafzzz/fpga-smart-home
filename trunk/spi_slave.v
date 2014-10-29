module SPI_slave(clk, SCK, MOSI, MISO, SSEL, LED,byte_data_received,HYM2);
input clk;
output reg [87:0] byte_data_received; 
input SCK, SSEL, MOSI;
output MISO;
output LED;
input [39:0]HYM2; // вектор входа инфы с блока влажности
//input final_bite_receive; // если =1 то можно передавать по спи данные, т.к. регистр HYM полностью сформирован.



// sync SCK to the FPGA clock using a 3-bits shift register
reg [2:0] SCKr;  always @(posedge clk) SCKr <= {SCKr[1:0], SCK};
wire SCK_risingedge = (SCKr[2:1]==2'b01);  // now we can detect SCK rising edges
wire SCK_fallingedge = (SCKr[2:1]==2'b10);  // and falling edges

// same thing for SSEL
reg [2:0] SSELr;  always @(posedge clk) SSELr <= {SSELr[1:0], SSEL};
wire SSEL_active = ~SSELr[1];  // SSEL is active low
wire SSEL_startmessage = (SSELr[2:1]==2'b10);  // message starts at falling edge
wire SSEL_endmessage = (SSELr[2:1]==2'b01);  // message stops at rising edge

// and for MOSI
reg [1:0] MOSIr;  always @(posedge clk) MOSIr <= {MOSIr[0], MOSI};
wire MOSI_data = MOSIr[1];

// we handle SPI in 87-bits format, so we need a 7 bits counter to count the bits as they come in
reg [6:0] bitcnt;
reg [3:0] bit_cntr=7;

reg byte_received;  // high when a byte has been received
reg [7:0] cnt;
reg [39:0] HYM_send; // регистр куда помещаем инфу влажности с вектора входа, его и будем смещать при передаче.
reg [39:0] HYM_send_test;
initial HYM_send_test=39'b010101010101010101010101010101010101010;

always @(posedge clk)
begin
  if(~SSEL_active)
  begin
  bitcnt<=7'b0000000;
  
   end else if(SCK_risingedge)
				begin
				bitcnt<=bitcnt+7'b0000001;
				// implement a shift-left register (since we receive the data MSB first)
				byte_data_received <= {byte_data_received[86:0], MOSI_data}; 
				HYM_send_test<=HYM_send_test<<1;
				end 
end

/*
always @(posedge clk)
begin
if(SSEL==1) begin HYM_send<=HYM2; // помещаем данные из вектора входа в регистр если передача по спи не активна.
end else if (SCK_risingedge==1) begin HYM_send_test<=HYM_send_test>>1;
end
end 
*/

assign MISO=HYM_send_test[39];

endmodule