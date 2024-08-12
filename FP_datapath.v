module FP_datapath (input         clk,
                    input         rst,
	            input  [31:0] a  , 
	            input  [31:0] b  , 
	            input  [31:0] c  , 
	            input  [31:0] d  , 
	            output [31:0] g  );
wire [31:0] e;
wire [31:0] f;
FP_adder u1_FP_adder(.clock   (clk     ),
                     .reset   (rst     ),
                     .io_in_a (a       ),
                     .io_in_b (b       ),
                     .io_out_s(e       ));

FP_multiplier u2_FP_multiplier (.clock   (clk     ),
                     .reset   (rst     ),
                     .io_in_a (e       ),
                     .io_in_b (c       ),
                     .io_out_s(f       ));

FP_subber u3_FP_subber (.clock   (clk     ),
                     .reset   (rst     ),
                     .io_in_a (f       ),
                     .io_in_b (d       ),
                     .io_out_s(g       ));

endmodule
