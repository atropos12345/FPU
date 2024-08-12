module fpu_tb();

reg         clk; 
reg         rst;
reg         en ;
wire        fi ;
reg  [31:0] a  ; 
reg  [31:0] b  ; 
reg  [31:0] c  ; 
reg  [31:0] d  ; 
wire [31:0] g  ;

fpu u_fpu  (.clk(clk), 
            .rst(rst),
            .en (en ),
            .fi (fi ),
	    .a  (a  ), 
	    .b  (b  ), 
	    .c  (c  ), 
	    .d  (d  ), 
	    .g  (g  ));

initial begin
  clk=0; rst=1; en=0;
  #10 rst=0;
  @(negedge clk); en=1;
  a = 32'h3f80_0000;
  b = 32'h4000_0000;
  c = 32'h4040_0000;
  d = 32'h0000_0000;
  wait (fi) ;
  @(posedge clk);
  en=0;
end

always #50 clk=~clk;
endmodule
