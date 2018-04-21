module registro_PC (clk, pc_in, pc_out);

input wire clk;
input wire [5:0] pc_in;
reg [5:0]pc;
output reg [5:0] pc_out;

initial begin
    pc <= 0;
    pc_out <= 0;
end

always @(posedge clk) // lee en el posedge
begin
    pc<=pc_in;
end
always @(negedge clk) // escritura en el negedge
begin
	pc_out<=pc;
end

endmodule
