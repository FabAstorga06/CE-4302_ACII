module adelantamiento (
		dir_dest_ID,
		dir_dest_MEM,
		sel_ad,
		sel_vec
);

input wire [2:0] dir_dest_ID,dir_dest_MEM;
input wire sel_ad;

output reg [1:0] sel_vec;


always@*
begin
	if(dir_dest_ID==dir_dest_MEM)
		begin
		sel_vec<=2'b00;
		end
	else
		begin
			if(sel_ad==0)
			begin
				sel_vec<=2'b01;
			end
			else
			begin
				sel_vec<=2'b10;
			end
		end
end

endmodule 