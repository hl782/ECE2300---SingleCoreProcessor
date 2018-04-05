module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output wire [7:0]  DataA;
  output wire [7:0]  DataB;
  output wire [7:0]  DataC;
  output wire [7:0]  DataD;
  output wire       MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  wire [7:0] NextPC;
  
  wire [7:0] B, sIMM, PCw0, PCw1, PCw2, sOFF;
  wire [5:0] IMM, OFF;
  wire LD, MD, MB, MP, H, C, V, N, Z;
  wire [2:0] SA, SB, DR, FS, BS;
  
  //PC
	assign PCw0 = PC + 8'd2;
	assign PCw1 = PCw0 + sOFF;
	//assign PCw2 = PC;
	assign NextPC = H ? PC : (MP ? PCw1 : PCw0);
	
  always @(posedge CLK, posedge RESET) begin
  
	if (RESET == 1) begin PC <= 8'd0; end
	else begin 
	PC <= NextPC;
	end
	
  end
  
  //Offset sign extend
 signExOFF seOFF(
	.OFF(OFF), 
	.sOFF(sOFF)
	);
  
  //Branch Mux
  assign MP = (BS == 3'b000) ? Z : ((BS == 3'b001) ? ~Z : ((BS == 3'b010) ? ~N : ((BS == 3'b011) ? N : 0)));
  
  //Halt Logic
 haltlogic hall(
	.CLK(CLK), 
	.HALT(HALT), 
	.EN_L(EN_L), 
	.H(H)
	);
  
  //Decoder
decoder dec(
	.INST(Iin), 
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

  //Register File
register reg1(
	.CLK(CLK), 
	.RESET(RESET), 
	.SA(SA), 
	.SB(SB), 
	.LD(LD), 
	.DR(DR), 
	.D_in(DataC), 
	.OUTA(DataA), 
	.OUTB(DataB)
	);
	
	//Sign Extend
signEx seIMM(
	.IMM(IMM), 
	.sIMM(sIMM)
	);
	//MB Mux
	assign B = MB ? sIMM : DataB;
	
	//ALU
alu alu1(
	.A(DataA), 
	.B(B), 
	.OP(FS), 
	.Y(DataD), 
	.C(C), 
	.V(V), 
	.N(N), 
	.Z(Z)
	);
	
	//MD Mux
	assign DataC = MD ? Din : DataD;
	
endmodule
