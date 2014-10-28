module stepdirdriver (input STEP, input DIR,output reg [3:0] OUT);
reg [3:0] state;
initial
begin
	state=0;
end

always@(posedge STEP) begin
	if (DIR==1) begin
		state=state+1'b1;
	end else if (DIR==0) begin
		state=state-1'b1;
	end

	case (state)
	  0: OUT=4'b1000;
	  1: OUT=4'b1100;
	  2: OUT=4'b0100;
	  3: OUT=4'b0110;
	  4: OUT=4'b0010;
	  5: OUT=4'b0011;
	  6: OUT=4'b0001;
	  7: OUT=4'b1001;
   endcase
end
		  
endmodule
