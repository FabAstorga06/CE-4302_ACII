module registro_ID_EXE(clk,
	//señales de control

	//EXE
	sel_op_in,
	sel_vec_in,
	sel_int_in,
	opcode_in,
	//Memory
	sum_mem_in,
	sel_mem_in,
	sel_data_in,
	mem_wr_in,

	//Write back:
	sel_wb_in,
	reg_wrv_in,
	reg_wrs_in,

	//EXE
	sel_op_out,
	sel_vec_out,
	sel_int_out,
	opcode_out,
	//Memory
	sum_mem_out,
	sel_mem_out,
	sel_data_out,
	mem_wr_out,

	//Write back:
	sel_wb_out,
	reg_wrv_out,
	reg_wrs_out,

	// Entradas
	VEC1_in,
	VEC2_in,
	VFS_in,
	sca1_in,
	inmediato_in,
	dir_dest_in,
	shift_in,

	// Salidas
	VEC1_out,
	VEC2_out,
	VFS_out,
	sca1_out,
	inmediato_out,
	dir_dest_out,
	shift_out
);


input wire clk;


//EXE
input wire sel_op_in, sel_int_in;
input wire [1:0] sel_vec_in;
input wire [3:0] opcode_in;

//MEM
input wire  sum_mem_in, sel_mem_in, sel_data_in, mem_wr_in;

//WB
input wire sel_wb_in, reg_wrv_in, reg_wrs_in;



input wire [31:0] VEC1_in;
input wire [31:0] VEC2_in;
input wire [31:0] VFS_in;
input wire [7:0] sca1_in;
input wire [7:0] inmediato_in;
input wire [2:0] dir_dest_in;
input wire [7:0] shift_in;


//EXE
output reg sel_op_out, sel_int_out;
output reg [1:0] sel_vec_out;
output reg [3:0] opcode_out;


//MEM
output reg sum_mem_out, sel_mem_out, sel_data_out, mem_wr_out;

//WB
output reg sel_wb_out, reg_wrv_out, reg_wrs_out;


output reg [31:0] VEC1_out;
output reg [31:0] VEC2_out;
output reg [31:0] VFS_out;
output reg [7:0] sca1_out;
output reg [7:0] inmediato_out;
output reg [2:0] dir_dest_out;
output reg [7:0] shift_out;



reg [31:0] VEC1;
reg [31:0] VEC2;
reg [31:0] VFS;

reg [7:0] sca1;
reg [7:0] inmediato;
reg [7:0] shift;

reg [2:0] dir_dest;

//señales de control
//EXE
reg sel_op, sel_int;
reg [1:0] sel_vec;
reg [3:0] opcode;

//MEM
reg sum_mem, sel_mem, sel_data, mem_wr;

//WB
reg sel_wb, reg_wrv, reg_wrs;

always @(posedge clk) // lee en el posedge
begin
   VEC1<=VEC1_in;
	VEC2<=VEC2_in;
	VFS<=VFS_in;
	sca1<=sca1_in;
	inmediato<=inmediato_in;
	shift<=shift_in;
	dir_dest <= dir_dest_in;

	//EXE
	sel_op<=sel_op_in;
	sel_vec<=sel_vec_in;
	sel_int<=sel_int_in;
	opcode<=opcode_in;
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
	VEC1_out<=VEC1;
	VEC2_out<=VEC2;
	VFS_out<=VFS;
	sca1_out<=sca1;
	inmediato_out<=inmediato;
	shift_out<=shift;
	dir_dest_out <= dir_dest;

	//EXE
	sel_op_out<=sel_op;
	sel_vec_out<=sel_vec;
	sel_int_out<=sel_int;
	opcode_out<=opcode;
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
