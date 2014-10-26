module Energy_saver (input clk1hz, input M_EN,input [3:0] OUT, output reg [3:0] OUT_final);


always @(*) begin
if(M_EN==1)begin
OUT_final=OUT;
end else OUT_final=4'b0000;
end
endmodule