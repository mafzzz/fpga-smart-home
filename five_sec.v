module five_sec (clk1M,flag_five_sec);
input clk1M;
output reg flag_five_sec;
reg [22:0] five_sec;

initial
begin
five_sec=0;
flag_five_sec=1;
end

always @(posedge clk1M) begin

	if(five_sec==5000000)begin
		five_sec=1'b0;
		flag_five_sec=1'b1;
	end else if(five_sec==2500000)begin
		flag_five_sec=1'b0;
		five_sec=five_sec+1'b1;
	end else begin
		five_sec=five_sec+1'b1;
	end

end

endmodule
