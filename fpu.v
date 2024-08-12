module fpu (input         clk, 
            input         rst,
            input         en ,
            output        fi ,
	    input  [31:0] a  , 
	    input  [31:0] b  , 
	    input  [31:0] c  , 
	    input  [31:0] d  , 
	    output [31:0] g  );

FP_datapath u_FP_datapath (.clk (clk),
                           .rst (rst),
	                   .a   (a  ), 
	                   .b   (b  ), 
	                   .c   (c  ), 
	                   .d   (d  ), 
	                   .g   (g  ));

timing_ctl u_timing_ctl (.clk    (clk    ), 
                         .rst    (rst    ),
			 .add_vld(add_vld), 
			 .mul_vld(mul_vld),       
		         .sub_vld(sub_vld),
	                 .en     (en     ),
	                 .fi     (fi     ));
endmodule
