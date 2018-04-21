module registro_MEM_WB(clk,

	//Write back:
	sel_wb_in,
	reg_wrv_in,
	reg_wrs_in,
	

	//Write back:
	sel_wb_out,
	reg_wrv_out,
	reg_wrs_out,
	
	//entradas
		MEM_in,
		DATA_in,
		dir_dest_in,
		data_wrs_in,
	//salidas
		MEM_out,
		DATA_out,
		dir_dest_out,
		data_wrs_out
	
);
input wire clk;

//WB
input wire sel_wb_in, reg_wrv_in, reg_wrs_in;
	
input wire [31:0] MEM_in;
input wire [31:0]DATA_in;
input wire [2:0] dir_dest_in;
input wire [7:0] data_wrs_in;


//WB
output reg sel_wb_out, reg_wrv_out, reg_wrs_out;

output reg [31:0] MEM_out;
output reg [31:0] DATA_out;
output reg [2:0] dir_dest_out;
output reg [7:0] data_wrs_out;

//WB
reg sel_wb, reg_wrv, reg_wrs;

reg [31:0] MEM;
reg [31:0] DATA;
reg [2:0] dir_dest;
reg [7:0] data_wrs;


always @(posedge clk) // lee en el posedge
begin
	
	MEM<=MEM_in;
	DATA<=DATA_in;
	dir_dest<=dir_dest_in;
	data_wrs<=data_wrs_in;
	
	//Write back:
	sel_wb<=sel_wb_in;
	reg_wrv<=reg_wrv_in;
	reg_wrs<=reg_wrs_in;
end 

always @(negedge clk) // escritura en el negedge
begin

	MEM_out<=MEM;
	DATA_out<=DATA;
	dir_dest_out<=dir_dest;
	data_wrs_out<=data_wrs;
	  

	//Write back:
	sel_wb_out<=sel_wb;
	reg_wrv_out<=reg_wrv;
	reg_wrs_out<=reg_wrs;
end

endmodule
