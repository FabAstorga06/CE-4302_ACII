module registros_sca(
clk, // Clock Input
reg_wr, // señal de escritura
reg_rd, //señal de lectura
reg_sca1, //direccion de registro escalar 1
dir_wrs, //direccion de dato a escribir en banco de registros
sca1, //datos del registro escala 1
data_wr, //datos a escribir
reg0,
reg1,
reg2,
reg3
);


//--------------Input Ports-----------------------

input [2:0] reg_sca1;
input [2:0] dir_wrs;


output reg [7:0] sca1,reg0,reg1,reg2,reg3;
input clk;
input reg_wr,reg_rd; // Bandera de control para la escritura en la memoria
input wire [7:0] data_wr; // Dato que se escribe en el write-back

reg [7:0] mem [0:7];


initial begin
    mem[0] <= 0; //
    mem[1] <= 0; // 
    mem[2] <= 0; // 
    mem[3] <= 0; //         
    mem[4] <= 0; //         
    mem[5] <= 0; //         
    mem[6] <= 0; //         
    mem[7] <= 0; //         
end



always @(posedge clk)
begin
	if(reg_rd)begin
    sca1 = mem[reg_sca1];
	 reg0=mem[0];
	 reg1=mem[1];
	 reg2=mem[2];
	 reg3=mem[3];
	 
	 end
	 
end
always @(negedge clk)
begin
	if (reg_wr) begin //si la bandera no esta en 1 ignora la lectura del dato (guardar dato en el banco de registro)
        mem[dir_wrs] <= data_wr;
	end
end

endmodule 