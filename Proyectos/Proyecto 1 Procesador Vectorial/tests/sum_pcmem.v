module sum_pcmem(
					dataa,
					result,
					enable);



input wire [31:0]dataa;
input wire enable;

output reg [31:0] result;

initial begin

    result <= 0;
end

always @(negedge enable)
begin
	result<=dataa+1;
end

endmodule
