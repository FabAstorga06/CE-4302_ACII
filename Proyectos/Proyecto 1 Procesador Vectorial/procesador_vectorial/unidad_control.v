module unidad_control(
	opcode_in,
	reset,

	//fetch
	sel_pc,
	//decode
	reg_rdv,
	reg_rds,
	sel_dest,
	//EXE
	sel_op,
	sel_ad,
	sel_int,
	opcode_out,
	//Memory
	sum_mem,
	sel_mem,
	sel_data,
	mem_wr,

	//Write back:
	sel_wb,
	reg_wrv,
	reg_wrs
);

input wire [3:0] opcode_in;
input wire reset;

output reg sel_pc;
output reg reg_rdv;
output reg reg_rds;
output reg sel_dest;
				//EXE
output reg sel_op;
output reg sel_ad;
output reg sel_int;
output reg [3:0]opcode_out;
				//Memory
output reg sum_mem;
output reg sel_mem;
output reg sel_data;
output reg mem_wr;
				//Write back:
output reg sel_wb;
output reg reg_wrv;
output reg reg_wrs;

initial begin
	//fetch
	sel_pc<=1;

	//decode
	sel_dest<=0;
	reg_rdv<=0;
	reg_rds<=0;

	//EXE
	sel_op<=0;
	sel_ad<=0;
	sel_int<=0;
	opcode_out<=opcode_in;

	//Memory
	sum_mem<=0;
	sel_mem<=0;
	sel_data<=0;
	mem_wr<=0;
	//Write back:
	sel_wb<=0;
	reg_wrv<=0;
	reg_wrs<=0;
end

always @* //cada cuando tiene que verificar, siempre? o cuando ocurre un cambio en especifico
begin
	if (reset == 1)
		begin
			//fetch
			sel_pc<=0;

			//decode
			sel_dest<=0;
			reg_rdv<=0;
			reg_rds<=0;

			//EXE
			sel_op<=0;
			sel_ad<=0;
			sel_int<=0;
			opcode_out<=opcode_in;

			//Memory
			sum_mem<=0;
			sel_mem<=0;
			sel_data<=0;
			mem_wr<=0;
			//Write back:
			sel_wb<=0;
			reg_wrv<=0;
			reg_wrs<=0;
		end
		
    case (opcode_in)
		4'b0000:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=0;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=0;
				reg_wrv<=0;
				reg_wrs<=0;
			end
		4'b0001:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=1;
				reg_wrs<=0;

			end
		4'b0010:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=1;
				reg_wrs<=0;

			end
		4'b0011:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=1;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=1;
				sel_data<=1;
				mem_wr<=0;
				//Write back:
				sel_wb<=0;
				reg_wrv<=1;
				reg_wrs<=0;

			end
		4'b0100:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=1;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=1;
				sel_data<=1;
				mem_wr<=1;
				//Write back:
				sel_wb<=0;
				reg_wrv<=0;
				reg_wrs<=0;

			end
		4'b0101:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;
			end
		4'b0110:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=1;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;

			end
		4'b0111:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=1;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;

			end
		4'b1000:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=1;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;

			end
		4'b1001:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=1;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;
			end
		4'b1010:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;
			end
		4'b1011:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=1;
				reg_rds<=1;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=1;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=0;
			end
		4'b1100:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=1;
				reg_rdv<=0;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=1;

			end
		4'b1101:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=0;
				reg_rdv<=0;
				reg_rds<=1;

				//EXE
				sel_op<=0;
				sel_ad<=1;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=0;
				mem_wr<=0;
				//Write back:
				sel_wb<=1;
				reg_wrv<=0;
				reg_wrs<=1;

			end
		4'b1110:
			begin
				//fetch
				sel_pc<=0;

				//decode
				sel_dest<=1;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=0;
				sel_mem<=0;
				sel_data<=1;
				mem_wr<=0;
				//Write back:
				sel_wb<=0;
				reg_wrv<=1;
				reg_wrs<=0;
			end
		4'b1111:
			begin
				//fetch
				sel_pc<=1;

				//decode
				sel_dest<=1;
				reg_rdv<=1;
				reg_rds<=0;

				//EXE
				sel_op<=0;
				sel_ad<=0;
				sel_int<=0;
				opcode_out<=opcode_in;

				//Memory
				sum_mem<=1;
				sel_mem<=0;
				sel_data<=1;
				mem_wr<=1;
				//Write back:
				sel_wb<=0;
				reg_wrv<=0;
				reg_wrs<=0;

			end
		default begin
			//fetch
			sel_pc<=1;

			//decode
			sel_dest<=0;
			reg_rdv<=0;
			reg_rds<=0;

			//EXE
			sel_op<=0;
			sel_ad<=0;
			sel_int<=0;
			opcode_out<=opcode_in;

			//Memory
			sum_mem<=0;
			sel_mem<=0;
			sel_data<=0;
			mem_wr<=0;
			//Write back:
			sel_wb<=0;
			reg_wrv<=0;
			reg_wrs<=0;
		end
			
    endcase
end
endmodule
