`timescale 1ns / 1ps

//Copy this content to create a testbech file
module IF_test;

	// Inputs
    reg clk;
    reg [2:0] sel_dir;
    reg sel_pc;

    //Outputs
    wire [13:0] instruccion;
    wire [3:0] opcode;

   
	
	// Instantiate the Device Under Test (DUT)
    etapa_IF fetch (.clk(clk), .sel_dir(sel_dir), .sel_pc(sel_pc), 
                   .instruccion(instruccion), .opcode(opcode) );
                                    //Datos de entrada
   
	
	//Initialize clock
	initial begin
    
       // Se establecen entradas
       clk = 0;
	   sel_pc = 1'b1;
       sel_dir = 3'b0;
       #5;

        forever begin 
        #5;
        clk = ~clk;  
        sel_pc = 1'b0;

		end
	end
	
	
endmodule
