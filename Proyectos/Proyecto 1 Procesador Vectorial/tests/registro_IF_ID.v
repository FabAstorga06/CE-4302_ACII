module registro_IF_ID(
	// Entradas
	instruction_in,
	clk,

	// Salidas
	instruction_out
);

input wire clk;

reg [13:0] instruction;
input wire [13:0] instruction_in;
output reg [13:0] instruction_out;


always @(posedge clk) // lee en el posedge (Le llega el dato en el posedge)
begin
    instruction<=instruction_in;
end
always @(negedge clk) // escritura en el negedge (Suelta el dato en el negedge)
begin
	instruction_out<=instruction;
end

endmodule
