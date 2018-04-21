module alu(
    val_a,
	 val_b,
    opcode,
    resultado
    );

input wire [7:0] val_a,val_b;
input wire [3:0] opcode;
output reg [7:0] resultado;


always @*
begin
    case (opcode)
		4'b0001: resultado <= val_a + val_b;	//SUMA vector-vector
		4'b0010: resultado <= val_a - val_b;	//RESTA vector-vector
		4'b0101: resultado <= val_a ^ val_b; //XOR vector-escalar
		4'b0110: resultado <= val_a << val_b;	//SHIFT LEFT vector-escalar
		4'b0111: resultado <= val_a >> val_b;	//SHIFT RIGHT vector-escalar
		4'b1000: resultado <= (val_a << val_b) | (val_a >> 4'b1000-val_b);	//SHIFT LEFT CIRCULAR vector-escalar
		4'b1001: resultado <= (val_a >> val_b) | (val_a << 4'b1000-val_b);	//SHIFT RIGHT CIRCULAR vector-escalar
		4'b1010: resultado <= val_a + val_b;	//SUMA vector-escalar
		4'b1011: resultado <= val_a - val_b;	//RESTA vector-escalar
		4'b1111: resultado <= val_a + val_b;	//VFS (offset)
		default: resultado <= 8'b0;
    endcase
end
endmodule
