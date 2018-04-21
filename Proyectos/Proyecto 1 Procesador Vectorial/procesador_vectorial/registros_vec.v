module registros_vec(
clk, // Clock Input
reg_wr, // señal de escritura
reg_rd, //señal de lectura
reg_vec1, //direccion de registro vectorial 1
reg_vec2, //direccion de registro vectorial 2
dir_wrv, //direccion de dato a escribir en banco de registros
vec1, //datos del registro vectorial 1
vec2, //datos del registro vectorial 2
data_wr //datos a escribir
);


//--------------Input Ports-----------------------

input [2:0] reg_vec1;
input [2:0] reg_vec2;
input [2:0] dir_wrv;


output reg [31:0] vec1;
output reg [31:0] vec2;
input clk;
input reg_wr,reg_rd; // Bandera de control para la escritura en la memoria
input wire [31:0] data_wr; // Dato que se escribe en el write-back

reg [31:0] mem [0:7];


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

//En negedge captura el dato


always @(posedge clk)
begin
	if(reg_rd)begin
    vec1 = mem[reg_vec1];
    vec2 = mem[reg_vec2];
	 end
	 
end
always @(negedge clk)
begin
	if (reg_wr) begin //si la bandera no esta en 1 ignora la lectura del dato (guardar dato en el banco de registro)
        mem[dir_wrv] <= data_wr;
	end
end

endmodule 