module registro_EXE_MEM(clk,
	//Memory
	sum_mem_in,
	sel_mem_in,
	sel_data_in,
	mem_wr_in,

	//Write back:
	sel_wb_in,
	reg_wrv_in,
	reg_wrs_in,
	
	//Memory
	sum_mem_out,
	sel_mem_out,
	sel_data_out,
	mem_wr_out,

	//Write back:
	sel_wb_out,
	reg_wrv_out,
	reg_wrs_out,
	
	//entradas
	DATA1_in,
	ALU_in,
	dir_dest_in,
	inmediato_in,
	
	//salidas
	DATA1_out,
	ALU_out,
	dir_dest_out,
	inmediato_out

);

input wire clk;

//MEM
input wire  sum_mem_in, sel_mem_in, sel_data_in, mem_wr_in;

//WB
input wire sel_wb_in, reg_wrv_in, reg_wrs_in;

//entradas
input wire [31:0] DATA1_in;
input wire [31:0] ALU_in;
input wire [2:0] dir_dest_in;
input wire [7:0] inmediato_in;
	
	


//MEM
output reg sum_mem_out, sel_mem_out, sel_data_out, mem_wr_out;

//WB
output reg sel_wb_out, reg_wrv_out, reg_wrs_out;

//salidas
output reg [31:0] DATA1_out;
output reg [31:0] ALU_out;
output reg [2:0] dir_dest_out;
output reg [7:0] inmediato_out;

//MEM
reg  sum_mem, sel_mem, sel_data, mem_wr;

//WB
reg sel_wb, reg_wrv, reg_wrs;


reg [31:0] DATA1;
reg [31:0] ALU;
reg [2:0] dir_dest;
reg [7:0] inmediato;


always @(posedge clk) // lee en el posedge
begin
	DATA1<=DATA1_in;
	ALU<=ALU_in;
	dir_dest<=dir_dest_in;
	inmediato<=inmediato_in;
	
	//Memory
	sum_mem<=sum_mem_in;
	sel_mem<=sel_mem_in;
	sel_data<=sel_data_in;
	mem_wr<=mem_wr_in;

	//Write back:
	sel_wb<=sel_wb_in;
	reg_wrv<=reg_wrv_in;
	reg_wrs<=reg_wrs_in;
end 

always @(negedge clk) // escritura en el negedge
begin
	
	DATA1_out<=DATA1;
	ALU_out<=ALU;
	dir_dest_out<=dir_dest;
	inmediato_out<=inmediato;
	  
	//Memory
	sum_mem_out<=sum_mem;
	sel_mem_out<=sel_mem;
	sel_data_out<=sel_data;
	mem_wr_out<=mem_wr;

	//Write back:
	sel_wb_out<=sel_wb;
	reg_wrv_out<=reg_wrv;
	reg_wrs_out<=reg_wrs;
end

endmodule
