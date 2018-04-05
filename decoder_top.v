module decoder_top(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);
	
	input [15:0] INST;
	output [2:0] DR, SA, SB, FS, BS;
	output [5:0] IMM, OFF;
	output MB, MD, LD, MW, HALT;
  
  reg  [2:0]  DR_REF;
  reg  [2:0]  SA_REF;
  reg  [2:0]  SB_REF;
  reg  [5:0]  IMM_REF;
  reg 		  MB_REF;
  reg  [2:0]  FS_REF;
  reg  		  MD_REF;
  reg 		  LD_REF;
  reg 		  MW_REF;
  
  decoder dec(
	  .INST(INST),
	  .DR(DR),
	  .SA(SA),
	  .SB(SB),
	  .IMM(IMM),
	  .MB(MB),
	  .FS(FS),
	  .MD(MD), 
	  .LD(LD), 
	  .MW(MW), 
	  .BS(BS), 
	  .OFF(OFF), 
	  .HALT(HALT)
  );
  
endmodule