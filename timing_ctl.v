module timing_ctl(input      clk, 
                  input      rst,
	          input      en ,
		  output add_vld,
		  output mul_vld,
		  output sub_vld,
	          output      fi);

reg  [1:0] cnt  ;
wire [1:0] nxt_cnt = en ? cnt+2'h1 : cnt; 
                                     
always @(posedge clk, posedge rst) begin
  if(rst) begin
    cnt <= 2'h0;
  end else begin
    cnt <= nxt_cnt;
  end
end

assign add_vld = (cnt == 2'h1);
assign mul_vld = (cnt == 2'h2);
assign sub_vld = (cnt == 2'h3);
assign fi = cnt==2'h3;
endmodule
