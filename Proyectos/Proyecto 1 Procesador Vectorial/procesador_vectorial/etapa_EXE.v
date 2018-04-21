module etapa_EXE(
	//Datos de entrada
    vector_a,
    vector_b,
	 vfs,
	 out_s,
	 shamt,
	 dir_dest_in,
	 inmediate_in,
	 vector_ad,

	 //Señales de entrada
	 opcode,
	 sel_vec,
	 sel_int,
	 sel_op,


	 //Datos de salida
	 data1_out,
	 alu_result,
	 dir_dest_out,
	 inmediate_out
    );

input wire [31:0] vector_a, vector_b, vector_ad, vfs;
input wire [7:0] out_s, shamt, inmediate_in;
input wire [2:0] dir_dest_in;

input wire [3:0] opcode;
input wire [1:0] sel_vec;
input wire sel_int, sel_op;


output wire [31:0] data1_out, alu_result;
output wire [7:0] inmediate_out;
output wire [2:0] dir_dest_out;

wire [31:0] mux_sel_int_input;
wire [31:0] mux_sel_int_output; //Cable que posteriormente se divide en 4 entradas a las ALUs
wire [7:0] mux_sel_op_output;

//Cables que entran a las ALUs
wire [7:0] alu1_in_1;
wire [7:0] alu2_in_1;
wire [7:0] alu3_in_1;
wire [7:0] alu4_in_1;

wire [7:0] alu1_in_2;
wire [7:0] alu2_in_2;
wire [7:0] alu3_in_2;
wire [7:0] alu4_in_2;

assign alu1_in_1 = data1_out [7:0];
assign alu2_in_1 = data1_out [15:8];
assign alu3_in_1 = data1_out [23:16];
assign alu4_in_1 = data1_out [31:24];

assign alu1_in_2 = mux_sel_int_output [7:0];
assign alu2_in_2 = mux_sel_int_output [15:8];
assign alu3_in_2 = mux_sel_int_output [23:16];
assign alu4_in_2 = mux_sel_int_output [31:24];

assign inmediate_out = inmediate_in;
assign dir_dest_out=dir_dest_in;

assign mux_sel_int_input [7:0] = mux_sel_op_output;
assign mux_sel_int_input [15:8] = mux_sel_op_output;
assign mux_sel_int_input [23:16] = mux_sel_op_output;
assign mux_sel_int_input [31:24] = mux_sel_op_output;


alu alu1(
    .val_a(alu1_in_1),
    .val_b(alu1_in_2),
    .opcode(opcode),
    .resultado(alu_result[7:0])
    );

alu alu2(
    .val_a(alu2_in_1),
    .val_b(alu2_in_2),
    .opcode(opcode),
    .resultado(alu_result[15:8])
    );

alu alu3(
    .val_a(alu3_in_1),
    .val_b(alu3_in_2),
    .opcode(opcode),
    .resultado(alu_result[23:16])
    );

alu alu4(
    .val_a(alu4_in_1),
    .val_b(alu4_in_2),
    .opcode(opcode),
    .resultado(alu_result[31:24])
    );

mux_3x32 mux_sel_vec(
	.data0x(vector_ad),
	.data1x(vector_a),
	.data2x(vfs),
	.sel(sel_vec),
	.result(data1_out)
);

mux_2x32 mux_sel_int(
	.data0x(vector_b),
	.data1x(mux_sel_int_input),
	.result(mux_sel_int_output),
	.sel(sel_int)
);


mux_2x8 mux_sel_op(
	.data0x(out_s),
	.data1x(shamt),
	.result(mux_sel_op_output),
	.sel(sel_op)
);




endmodule
