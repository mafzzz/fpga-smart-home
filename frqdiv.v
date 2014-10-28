module  frqdiv (clk50M,clk1hz,clk25M,clk1M);
input clk50M;
output reg clk1hz;
output reg clk25M;
output reg clk1M;
reg [31:0] i;
reg [2:0] j;
reg [5:0] z;
initial
begin
i=0;
j=0;
z=0;
clk1hz=0;
clk25M=0;
clk1M=0;
end


always@(posedge clk50M)
begin
i=i+1;
if (i == 50000) 
	begin
		clk1hz = ~clk1hz;
		i=0;
end
j=j+1'b1;
if (j == 2) 
	begin
		clk25M = ~clk25M;
		j=0;
	end

z=z+1'b1;
if (z == 25) 
	begin
		clk1M = ~clk1M;
		z=0;
	end	
end
endmodule