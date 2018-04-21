module etapa_MEM(
	//Datos de entrada
	inmediate_in,
	data1_in,
	result_alu,
	dir_dest_in,

	//Banderas de entrada
	sum_mem,
	sel_mem,
	sel_data,
	clk,
	final_mem,

	//Salidas
	data,
	dir_dest_out,
	inmediate_out,

	dir_mem,

	//Salida de prueba. Borrar después.
	mem_wr, //Bandera de escritura de prueba
	mem_out
);

input wire clk;
input wire [31:0] data1_in, result_alu;
input wire [7:0] inmediate_in;
input wire [2:0] dir_dest_in;
input wire sum_mem, sel_mem, sel_data;
input wire [31:0] final_mem;

output wire [31:0] data; //Data: Data que funciona como doble salida, para el registro mem/wb y para memoria RAM.
output wire [7:0] inmediate_out;
output wire [2:0] dir_dest_out;
output wire [31:0] dir_mem; //dir_mem: dirección de entrada en la memoria. Es salida porque se dirige a la memoria RAM.

wire [31:0] pcmem_input, pcmem_output, sum_mem_out;
wire [31:0] cable_zero;
wire [31:0] sel_mem_inmediate; //Inmediato de 32 bits extendido del inmediate_in de 8 bits.
wire sel_pcmem;

assign sel_mem_inmediate = {24'b0, inmediate_in};
assign cable_zero = 32'b0;
assign inmediate_out = inmediate_in;
assign dir_dest_out = dir_dest_in;

//Cables extra solo para pruebas. Borrar después.
output wire [31:0] mem_out; //Dato de salida de la mem de prueba
wire [31:0] data_in_mem;
wire [7:0] dir_mem_in;
assign data_in_mem = data;	//Dato que ingresa a la memoria. Funciona para la escritura.
assign dir_mem_in = dir_mem[7:0];
input wire mem_wr;


registro_PCMEM reg_pcmem(
	.clk(clk),
	.pc_in(pcmem_input),
	.pc_out(pcmem_output)
);

mux_2x32 mux_sel_pcmem(
	.data0x(sum_mem_out),
	.data1x(cable_zero),
	.sel(sel_pcmem),
	.result(pcmem_input)
);

mux_2x32 mux_sel_mem(
	.data0x(pcmem_output),
	.data1x(sel_mem_inmediate),
	.sel(sel_mem),
	.result(dir_mem)
);

mux_2x32 mux_sel_data(
	.data0x(data1_in),
	.data1x(result_alu),
	.sel(sel_data),
	.result(data)
);

compare_pcmem compare(
	.dataa(final_mem),
	.datab(pcmem_output),
	.aeb(sel_pcmem)
);

sum_pcmem sum(
	.dataa(pcmem_output),
	.result(sum_mem_out),
	.enable(sum_mem)
);

//Instancia de la memoria de prueba
ram_v1 ram(
	.address(dir_mem[7:0]),
	.clock(clk),
	.data(data),
	.wren(mem_wr),
	.q(mem_out)
);

endmodule
