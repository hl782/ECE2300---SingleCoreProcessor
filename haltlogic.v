module haltlogic(CLK, HALT, EN_L, H);
	input CLK, HALT, EN_L;
	output wire H;
	
	assign H = (HALT & EN_L) ? 1'b1:1'b0;
	
endmodule