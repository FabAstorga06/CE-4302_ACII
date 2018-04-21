// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module compare_pcmem (
	dataa,
	datab,
	aeb);

	input	[31:0]  dataa;
	input	[31:0]  datab;
	output	reg  aeb;

initial begin
	aeb<=1;
end
always @ ( * ) begin
	if (dataa==datab) begin
		aeb<=1;
	end
	else
		begin
		aeb<=0;
		end
end
endmodule
