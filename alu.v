module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;

  wire LOP, LR, LA, BSEL, CISEL, CI, Va, Ca, Cs;
  wire [1:0] OSEL;
  wire [7:0] Ya, Ys, Yl, BI;
  
  // ADD YOUR CODE BELOW THIS LINE
  assign C = (OSEL == 2'b0) ? Ca : ((OSEL == 2'b01) ? Cs : 1'b0);
  assign V = (OSEL == 2'b0) ? Va : 1'b0;
  assign N = Y[7];
  assign Z = (Y == 8'b0) ? 1 : 0;
  
  assign BI = (BSEL == 1'b0) ? B : ~B;
  assign CI = (CISEL == 1'b0) ? 1'b0 : 1'b1;
  assign Y = (OSEL == 2'b0) ? Ya : ((OSEL == 2'b01) ? Ys : Yl);
 
  control cntrl1(
	.OP(OP),
	.BSEL(BSEL), 
	.OSEL(OSEL), 
	.CISEL(CISEL), 
	.SHIFT_LA(LA), 
	.SHIFT_LR(LR), 
	.LOGICAL_OP(LOP)
	);
	
 adder add1(
	.A(A),
	.B(BI),
	.CI(CI),
	.Y(Ya),
	.CO(Ca),
	.V(Va)
 );
	
 shifter shft1(
	.A(A), 
	.Y(Ys), 
	.C(Cs), 
	.LA(LA), 
	.LR(LR)
	);
 
 logical logic1(
	.A(A), 
	.B(BI), 
	.LOGICAL_OP(LOP), 
	.Y(Yl)
	);
	
  // ADD YOUR CODE ABOVE THIS LINE


endmodule
