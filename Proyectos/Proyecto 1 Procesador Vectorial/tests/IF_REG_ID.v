`timescale 1ns / 1ps

module IF_REG_ID;

// Inputs
  reg clk;
  reg [2:0] sel_dir;

  reg [31:0] final_mem;
  //Outputs
  //FETCH
  wire [13:0] instruccion;

  //UC
  wire reg_rdv_UC, reg_rds_UC, sel_dest_UC, sel_op, sel_ad_UC,sel_int,
               sum_mem, sel_mem, sel_data, mem_wr_UC, sel_wb,reg_wrv, reg_wrs, sel_pc;
  wire [3:0] opcode_outUC;

  //REGISTRO IF/ID
  wire [13:0] instruction_out;

  //DECODE
  wire [3:0] opcode_ID;
  wire [7:0] shift_ID;
  wire [7:0] inmediato_ID;
  wire [2:0] dir_dest_out_ID;
  wire [31:0] data_vec1_ID;
  wire [31:0] data_vec2_ID;
  wire [7:0] data_sca1_ID;
  wire [31:0] VFS_ID;

  //REGISTRO ID/EXE
  wire sel_op_out_RIE, sel_int_out_RIE;
  wire [1:0] sel_vec_out_RIE;
  wire [3:0] opcode_out_RIE;
  //MEM
  wire sum_mem_out_RIE, sel_mem_out_RIE, sel_data_out_RIE, mem_wr_out_RIE;
  //WB
  wire sel_wb_out_RIE, reg_wrv_out_RIE, reg_wrs_out_RIE;

  //salidas registro ID_EXE
  wire [31:0] VEC1_out_RIE;
  wire [31:0] VEC2_out_RIE;
  wire [31:0] VFS_out_RIE;
  wire [7:0] sca1_out_RIE;
  wire [7:0] inmediato_out_RIE;
  wire [2:0] dir_dest_out_RIE;
  wire [7:0] shift_out_RIE;

  //EXE
  wire [31:0] data1_out_E, alu_result_E;
  wire [7:0] inmediate_out_EXE;
  wire [2:0] dir_dest_out_EXE;

  //registro_EXE_MEM
  wire sum_mem_out_REM, sel_mem_out_REM, sel_data_out_REM, mem_wr_out_REM;

  //WB
  wire sel_wb_out_REM, reg_wrv_out_REM, reg_wrs_out_REM;

  //salidas
  wire [31:0] DATA1_out_REM;
  wire [31:0] ALU_out_REM;
  wire [2:0] dir_dest_out_REM;
  wire [7:0] inmediato_out_REM;

  //adelantamiento
  wire [1:0] sel_vec_AD;

  //Memory
  wire [31:0] data_M; //Data: Data que funciona como doble salida, para el registro mem/wb y para memoria RAM.
  wire [7:0] inmediate_out_M;
  wire [2:0] dir_dest_out_M;
  wire [31:0] dir_mem_M; //dir_mem: dirección de entrada en la memoria. Es salida porque se dirige a la memoria RAM.

  wire [31:0] mem_out;

  //registro _MEM_write_back

  wire sel_wb_out_RMW, reg_wrv_out_RMW, reg_wrs_out_RMW;

  wire [31:0] MEM_out_RMW;
  wire [31:0] DATA_out_RMW;
  wire [2:0] dir_dest_out_RMW;
  wire [7:0] data_wrs_out_RMW;

  //write_back
  wire [31:0] data_wbv_WB;





  etapa_IF fetch (
      .clk(clk), .sel_dir(sel_dir), .sel_pc(sel_pc),
      .instruccion(instruccion));

      defparam	fetch.decrypt_add_dir = 6'b0;
      defparam	fetch.decrypt_circ_shift_dir = 6'b0;
      defparam	fetch.decrypt_shift_dir = 6'b0;
      defparam	fetch.decrypt_xor_dir = 6'b0;
      defparam	fetch.encrypt_add_dir = 6'b0;
      defparam	fetch.encrypt_circ_shift_dir = 6'b0;
      defparam	fetch.encrypt_shift_dir = 6'b100;
      defparam	fetch.encrypt_xor_dir = 6'b0;

   unidad_control UC (
      .opcode_in(opcode_ID),.sel_pc(sel_pc), .reg_rdv(reg_rdv_UC), .reg_rds(reg_rds_UC),.sel_dest(sel_dest_UC),
      .sel_op(sel_op), .sel_ad(sel_ad_UC), .sel_int(sel_int), .sum_mem(sum_mem), .sel_mem(sel_mem), .sel_data(sel_data), .mem_wr(mem_wr_UC),
      .sel_wb(sel_wb), .reg_wrv(reg_wrv), .reg_wrs(reg_wrs), .opcode_out(opcode_outUC) ) ;


   registro_IF_ID regIDIF (
     //DATA
      .instruction_in(instruccion), .clk(clk), .instruction_out(instruction_out) );

    etapa_ID decode (
        //Señales de paso
      .clk(clk), .instruccion(instruction_out), .data_wrv(data_wbv_WB),
      .data_wrs(data_wrs_out_RMW), .i_dir_wr(dir_dest_out_RMW), .reg_wrv(reg_wrv_out_RMW), .reg_wrs(reg_wrs_out_RMW),
      .reg_rdv(reg_rdv_UC), .reg_rds(reg_rds_UC), .sel_dest(sel_dest_UC), .shift(shift_ID),
      .inmediato(inmediato_ID), .dir_dest_out(dir_dest_out_ID), .VFS(VFS_ID), .data_vec1(data_vec1_ID),
      .data_vec2(data_vec2_ID), .data_sca1(data_sca1_ID), .opcode(opcode_ID));


   registro_ID_EXE	RIE(
     	.clk(clk), .sel_op_in(sel_op), .sel_int_in(sel_int), .sum_mem_in(sum_mem), .sel_mem_in(sel_mem),
      .sel_data_in(sel_data), .mem_wr_in(mem_wr_UC), .sel_wb_in(sel_wb), .reg_wrv_in(reg_wrv), .reg_wrs_in(reg_wrs),
      .dir_dest_in(dir_dest_out_ID), .inmediato_in(inmediato_ID), .opcode_in(opcode_outUC), .sca1_in(data_sca1_ID),
      .sel_vec_in(sel_vec_AD), .shift_in(shift_ID), .VEC1_in(data_vec1_ID), .VEC2_in(data_vec2_ID), .VFS_in(VFS_ID),
      .sel_op_out(sel_op_out_RIE), .sel_int_out(sel_int_out_RIE),	.sum_mem_out(sum_mem_out_RIE), .sel_mem_out(sel_mem_out_RIE),
      .sel_data_out(sel_data_out_RIE), .mem_wr_out(mem_wr_out_RIE), .sel_wb_out(sel_wb_out_RIE), .reg_wrv_out(reg_wrv_out_RIE),
      .reg_wrs_out(reg_wrs_out_RIE),	.dir_dest_out(dir_dest_out_RIE),	.inmediato_out(inmediato_out_RIE),	.opcode_out(opcode_out_RIE),
      .sca1_out(sca1_out_RIE), .sel_vec_out(sel_vec_out_RIE), .shift_out(shift_out_RIE), .VEC1_out(VEC1_out_RIE), .VEC2_out(VEC2_out_RIE),
      .VFS_out(VFS_out_RIE));

    etapa_EXE	EXE(
    	.sel_int(sel_int_out_RIE), .sel_op(sel_op_out_RIE), .dir_dest_in(dir_dest_out_RIE),
    	.inmediate_in(inmediato_out_RIE), .opcode(opcode_out_RIE), .out_s(sca1_out_RIE), .sel_vec(sel_vec_out_RIE),
    	.shamt(shift_out_RIE), .vector_a(VEC1_out_RIE), .vector_ad(data_wbv_WB), .vector_b(VEC2_out_RIE), .vfs(VFS_out_RIE),
      .alu_result(alu_result_E), .data1_out(data1_out_E), .dir_dest_out(dir_dest_out_EXE), .inmediate_out(inmediate_out_EXE));

    registro_EXE_MEM	REM(
    	.clk(clk), .sum_mem_in(sum_mem_out_RIE), .sel_mem_in(sel_mem_out_RIE), .sel_data_in(sel_data_out_RIE),
    	.mem_wr_in(mem_wr_out_RIE), .sel_wb_in(sel_wb_out_RIE), .reg_wrv_in(reg_wrv_out_RIE), .reg_wrs_in(reg_wrs_out_RIE),
    	.ALU_in(alu_result_E), .DATA1_in(data1_out_E), .dir_dest_in(dir_dest_out_RIE), .inmediato_in(inmediato_out_RIE),
    	.sum_mem_out(sum_mem_out_REM), .sel_mem_out(sel_mem_out_REM), .sel_data_out(sel_data_out_REM), .mem_wr_out(mem_wr_out_REM),
    	.sel_wb_out(sel_wb_out_REM), .reg_wrv_out(reg_wrv_out_REM), .reg_wrs_out(reg_wrs_out_REM), .ALU_out(ALU_out_REM),
    	.DATA1_out(DATA1_out_REM), .dir_dest_out(dir_dest_out_REM), .inmediato_out(inmediato_out_REM));

    adelantamiento	ad(
    	.sel_ad(sel_ad_UC),
    	.dir_dest_EXE(dir_dest_out_M),
    	.dir_dest_ID(dir_dest_out_ID),
    	.sel_vec(sel_vec_AD));

    etapa_MEM	MEM(
    	.sum_mem(sum_mem_out_REM), .sel_mem(sel_mem_out_REM), .sel_data(sel_data_out_REM), .clk(clk),
      .data1_in(DATA1_out_REM), .dir_dest_in(dir_dest_out_REM), .final_mem(final_mem), .inmediate_in(inmediato_out_REM),
      .result_alu(ALU_out_REM), .data(data_M), .dir_dest_out(dir_dest_out_M), .dir_mem(dir_mem_M), .inmediate_out(inmediate_out_M),
      //de prueba
      .mem_wr(mem_wr_out_REM),//entrada,
      .mem_out(mem_out)//salida
      );

    registro_MEM_WB	RMW(
    	.clk(clk), .sel_wb_in(sel_wb_out_REM), .reg_wrv_in(reg_wrv_out_REM), .reg_wrs_in(reg_wrs_out_REM),
      .DATA_in(data_M), .data_wrs_in(inmediate_out_M), .dir_dest_in(dir_dest_out_M), .MEM_in(mem_out),
      .sel_wb_out(sel_wb_out_RMW), .reg_wrv_out(reg_wrv_out_RMW), .reg_wrs_out(reg_wrs_out_RMW),
      .DATA_out(DATA_out_RMW), .data_wrs_out(data_wrs_out_RMW), .dir_dest_out(dir_dest_out_RMW), .MEM_out(MEM_out_RMW));

    etapa_WB	WB(
    	.sel_wb(sel_wb_out_RMW), .data_ALU(DATA_out_RMW), .data_MEM(MEM_out_RMW), .data_wbv(data_wbv_WB));

      initial begin

           // Se establecen entradas
            clk = 0;
            sel_dir = 3'b001 ;
            final_mem= 31'b110111;
            #5;

            forever begin
            #5;
            clk = ~clk;
            end
    	end


    endmodule
