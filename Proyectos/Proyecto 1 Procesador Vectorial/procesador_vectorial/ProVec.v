// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
// CREATED		"Mon Apr 16 20:22:46 2018"

module ProVec(
	clk,
	data_mem,
	final_mem,
	sel_dir,
	mem_wr,
	dir_mem
);


input wire	clk;
input wire	[31:0] data_mem;
input wire	[31:0] final_mem;
input wire	[2:0] sel_dir;
output wire	mem_wr;
output wire	[31:0] dir_mem;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[2:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[2:0] SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[2:0] SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	[3:0] SYNTHESIZED_WIRE_28;
wire	[13:0] SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[2:0] SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	[7:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_74;
wire	[2:0] SYNTHESIZED_WIRE_40;
wire	[13:0] SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	[7:0] SYNTHESIZED_WIRE_52;
wire	[3:0] SYNTHESIZED_WIRE_53;
wire	[7:0] SYNTHESIZED_WIRE_54;
wire	[1:0] SYNTHESIZED_WIRE_55;
wire	[7:0] SYNTHESIZED_WIRE_56;
wire	[31:0] SYNTHESIZED_WIRE_57;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[31:0] SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	[2:0] SYNTHESIZED_WIRE_62;
wire	[7:0] SYNTHESIZED_WIRE_63;
wire	[3:0] SYNTHESIZED_WIRE_64;
wire	[7:0] SYNTHESIZED_WIRE_65;
wire	[1:0] SYNTHESIZED_WIRE_66;
wire	[7:0] SYNTHESIZED_WIRE_67;
wire	[31:0] SYNTHESIZED_WIRE_68;
wire	[31:0] SYNTHESIZED_WIRE_70;
wire	[31:0] SYNTHESIZED_WIRE_71;





etapa_IF	b2v_inst1(
	.clk(clk),
	.sel_pc(SYNTHESIZED_WIRE_0),
	.sel_dir(sel_dir),
	.instruccion(SYNTHESIZED_WIRE_29));
	defparam	b2v_inst1.decrypt_add_dir = 6'b011101;
	defparam	b2v_inst1.decrypt_circ_shift_dir = 6'b010000;
	defparam	b2v_inst1.decrypt_shift_dir = 6'b001000;
	defparam	b2v_inst1.decrypt_xor_dir = 6'b000000;
	defparam	b2v_inst1.encrypt_add_dir = 6'b010100;
	defparam	b2v_inst1.encrypt_circ_shift_dir = 6'b001100;
	defparam	b2v_inst1.encrypt_shift_dir = 6'b000100;
	defparam	b2v_inst1.encrypt_xor_dir = 6'b000000;


registro_EXE_MEM	b2v_inst10(
	.clk(clk),
	.sum_mem_in(SYNTHESIZED_WIRE_1),
	.sel_mem_in(SYNTHESIZED_WIRE_2),
	.sel_data_in(SYNTHESIZED_WIRE_3),
	.mem_wr_in(SYNTHESIZED_WIRE_4),
	.sel_wb_in(SYNTHESIZED_WIRE_5),
	.reg_wrv_in(SYNTHESIZED_WIRE_6),
	.reg_wrs_in(SYNTHESIZED_WIRE_7),
	.ALU_in(SYNTHESIZED_WIRE_8),
	.DATA1_in(SYNTHESIZED_WIRE_9),
	.dir_dest_in(SYNTHESIZED_WIRE_10),
	.inmediato_in(SYNTHESIZED_WIRE_11),
	.sum_mem_out(SYNTHESIZED_WIRE_21),
	.sel_mem_out(SYNTHESIZED_WIRE_22),
	.sel_data_out(SYNTHESIZED_WIRE_23),
	.mem_wr_out(mem_wr),
	.sel_wb_out(SYNTHESIZED_WIRE_12),
	.reg_wrv_out(SYNTHESIZED_WIRE_13),
	.reg_wrs_out(SYNTHESIZED_WIRE_14),
	.ALU_out(SYNTHESIZED_WIRE_27),
	.DATA1_out(SYNTHESIZED_WIRE_24),
	.dir_dest_out(SYNTHESIZED_WIRE_25),
	.inmediato_out(SYNTHESIZED_WIRE_26));


registro_MEM_WB	b2v_inst12(
	.clk(clk),
	.sel_wb_in(SYNTHESIZED_WIRE_12),
	.reg_wrv_in(SYNTHESIZED_WIRE_13),
	.reg_wrs_in(SYNTHESIZED_WIRE_14),
	.DATA_in(SYNTHESIZED_WIRE_15),
	.data_wrs_in(SYNTHESIZED_WIRE_16),
	.dir_dest_in(SYNTHESIZED_WIRE_72),
	.MEM_in(data_mem),
	.sel_wb_out(SYNTHESIZED_WIRE_18),
	.reg_wrv_out(SYNTHESIZED_WIRE_33),
	.reg_wrs_out(SYNTHESIZED_WIRE_34),
	.DATA_out(SYNTHESIZED_WIRE_19),
	.data_wrs_out(SYNTHESIZED_WIRE_38),
	.dir_dest_out(SYNTHESIZED_WIRE_40),
	.MEM_out(SYNTHESIZED_WIRE_20));


etapa_WB	b2v_inst15(
	.sel_wb(SYNTHESIZED_WIRE_18),
	.data_ALU(SYNTHESIZED_WIRE_19),
	.data_MEM(SYNTHESIZED_WIRE_20),
	.data_wbv(SYNTHESIZED_WIRE_74));


etapa_MEM	b2v_inst16(
	.sum_mem(SYNTHESIZED_WIRE_21),
	.sel_mem(SYNTHESIZED_WIRE_22),
	.sel_data(SYNTHESIZED_WIRE_23),
	.clk(clk),
	.data1_in(SYNTHESIZED_WIRE_24),
	.dir_dest_in(SYNTHESIZED_WIRE_25),
	.final_mem(final_mem),
	.inmediate_in(SYNTHESIZED_WIRE_26),
	.result_alu(SYNTHESIZED_WIRE_27),
	.data(SYNTHESIZED_WIRE_15),
	.dir_dest_out(SYNTHESIZED_WIRE_72),
	.dir_mem(dir_mem),
	.inmediate_out(SYNTHESIZED_WIRE_16));


unidad_control	b2v_inst2(
	.opcode_in(SYNTHESIZED_WIRE_28),
	.sel_pc(SYNTHESIZED_WIRE_0),
	.reg_rdv(SYNTHESIZED_WIRE_35),
	.reg_rds(SYNTHESIZED_WIRE_36),
	.sel_dest(SYNTHESIZED_WIRE_37),
	.sel_op(SYNTHESIZED_WIRE_42),
	.sel_ad(SYNTHESIZED_WIRE_30),
	.sel_int(SYNTHESIZED_WIRE_43),
	.sum_mem(SYNTHESIZED_WIRE_44),
	.sel_mem(SYNTHESIZED_WIRE_45),
	.sel_data(SYNTHESIZED_WIRE_46),
	.mem_wr(SYNTHESIZED_WIRE_47),
	.sel_wb(SYNTHESIZED_WIRE_48),
	.reg_wrv(SYNTHESIZED_WIRE_49),
	.reg_wrs(SYNTHESIZED_WIRE_50),
	.opcode_out(SYNTHESIZED_WIRE_53));


registro_IF_ID	b2v_inst3(
	.clk(clk),
	.instruction_in(SYNTHESIZED_WIRE_29),
	.instruction_out(SYNTHESIZED_WIRE_41));


adelantamiento	b2v_inst4(
	.sel_ad(SYNTHESIZED_WIRE_30),
	.dir_dest_ID(SYNTHESIZED_WIRE_73),
	.dir_dest_MEM(SYNTHESIZED_WIRE_72),
	.sel_vec(SYNTHESIZED_WIRE_55));


etapa_ID	b2v_inst5(
	.clk(clk),
	.reg_wrv(SYNTHESIZED_WIRE_33),
	.reg_wrs(SYNTHESIZED_WIRE_34),
	.reg_rdv(SYNTHESIZED_WIRE_35),
	.reg_rds(SYNTHESIZED_WIRE_36),
	.sel_dest(SYNTHESIZED_WIRE_37),
	.data_wrs(SYNTHESIZED_WIRE_38),
	.data_wrv(SYNTHESIZED_WIRE_74),
	.i_dir_wr(SYNTHESIZED_WIRE_40),
	.instruccion(SYNTHESIZED_WIRE_41),
	.data_sca1(SYNTHESIZED_WIRE_54),
	.data_vec1(SYNTHESIZED_WIRE_57),
	.data_vec2(SYNTHESIZED_WIRE_58),
	.dir_dest_out(SYNTHESIZED_WIRE_73),
	.inmediato(SYNTHESIZED_WIRE_52),
	.opcode(SYNTHESIZED_WIRE_28),
	.shift(SYNTHESIZED_WIRE_56),
	.VFS(SYNTHESIZED_WIRE_59));


registro_ID_EXE	b2v_inst7(
	.clk(clk),
	.sel_op_in(SYNTHESIZED_WIRE_42),
	.sel_int_in(SYNTHESIZED_WIRE_43),
	.sum_mem_in(SYNTHESIZED_WIRE_44),
	.sel_mem_in(SYNTHESIZED_WIRE_45),
	.sel_data_in(SYNTHESIZED_WIRE_46),
	.mem_wr_in(SYNTHESIZED_WIRE_47),
	.sel_wb_in(SYNTHESIZED_WIRE_48),
	.reg_wrv_in(SYNTHESIZED_WIRE_49),
	.reg_wrs_in(SYNTHESIZED_WIRE_50),
	.dir_dest_in(SYNTHESIZED_WIRE_73),
	.inmediato_in(SYNTHESIZED_WIRE_52),
	.opcode_in(SYNTHESIZED_WIRE_53),
	.sca1_in(SYNTHESIZED_WIRE_54),
	.sel_vec_in(SYNTHESIZED_WIRE_55),
	.shift_in(SYNTHESIZED_WIRE_56),
	.VEC1_in(SYNTHESIZED_WIRE_57),
	.VEC2_in(SYNTHESIZED_WIRE_58),
	.VFS_in(SYNTHESIZED_WIRE_59),
	.sel_op_out(SYNTHESIZED_WIRE_61),
	.sel_int_out(SYNTHESIZED_WIRE_60),
	.sum_mem_out(SYNTHESIZED_WIRE_1),
	.sel_mem_out(SYNTHESIZED_WIRE_2),
	.sel_data_out(SYNTHESIZED_WIRE_3),
	.mem_wr_out(SYNTHESIZED_WIRE_4),
	.sel_wb_out(SYNTHESIZED_WIRE_5),
	.reg_wrv_out(SYNTHESIZED_WIRE_6),
	.reg_wrs_out(SYNTHESIZED_WIRE_7),
	.dir_dest_out(SYNTHESIZED_WIRE_62),
	.inmediato_out(SYNTHESIZED_WIRE_63),
	.opcode_out(SYNTHESIZED_WIRE_64),
	.sca1_out(SYNTHESIZED_WIRE_65),
	.sel_vec_out(SYNTHESIZED_WIRE_66),
	.shift_out(SYNTHESIZED_WIRE_67),
	.VEC1_out(SYNTHESIZED_WIRE_68),
	.VEC2_out(SYNTHESIZED_WIRE_70),
	.VFS_out(SYNTHESIZED_WIRE_71));


etapa_EXE	b2v_inst8(
	.sel_int(SYNTHESIZED_WIRE_60),
	.sel_op(SYNTHESIZED_WIRE_61),
	.dir_dest_in(SYNTHESIZED_WIRE_62),
	.inmediate_in(SYNTHESIZED_WIRE_63),
	.opcode(SYNTHESIZED_WIRE_64),
	.out_s(SYNTHESIZED_WIRE_65),
	.sel_vec(SYNTHESIZED_WIRE_66),
	.shamt(SYNTHESIZED_WIRE_67),
	.vector_a(SYNTHESIZED_WIRE_68),
	.vector_ad(SYNTHESIZED_WIRE_74),
	.vector_b(SYNTHESIZED_WIRE_70),
	.vfs(SYNTHESIZED_WIRE_71),
	.alu_result(SYNTHESIZED_WIRE_8),
	.data1_out(SYNTHESIZED_WIRE_9),
	.dir_dest_out(SYNTHESIZED_WIRE_10),
	.inmediate_out(SYNTHESIZED_WIRE_11));


endmodule
