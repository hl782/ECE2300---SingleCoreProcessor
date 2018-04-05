module signExOFF(OFF, sOFF);

	input [5:0] OFF;
	wire [6:0] iOFF;
	output [7:0] sOFF;

	assign iOFF[5:0] = OFF;
	assign iOFF[6] = OFF[5] ? 1'b1 : 1'b0;
	assign sOFF = {iOFF,1'b0};

endmodule



