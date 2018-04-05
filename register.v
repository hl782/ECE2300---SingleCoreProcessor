module register(CLK, RESET, SA, SB, LD, DR, D_in, OUTA, OUTB);

  input        CLK, LD, RESET;
  input  [7:0] D_in;
  input 	[2:0] SA, SB, DR;
  
  output reg[7:0] OUTA;
  output reg[7:0] OUTB;
  
  reg    [7:0] R0, R1, R2, R3, R4, R5, R6, R7;
  
  always @(*) begin
	case(SA)
		3'b000: OUTA = R0;
		3'b001: OUTA = R1;
		3'b010: OUTA = R2;
		3'b011: OUTA = R3;
		3'b100: OUTA = R4;
		3'b101: OUTA = R5;
		3'b110: OUTA = R6;
		3'b111: OUTA = R7;
		//default: OUTA = 0;
	endcase
	
	case(SB)
		3'b000: OUTB = R0;
		3'b001: OUTB = R1;
		3'b010: OUTB = R2;
		3'b011: OUTB = R3;
		3'b100: OUTB = R4;
		3'b101: OUTB = R5;
		3'b110: OUTB = R6;
		3'b111: OUTB = R7;
		//default: OUTB = 0;
	endcase
  end
  
  always @(posedge CLK, posedge RESET) begin
		if(RESET == 1) begin
			R0 <= 0;
			R1 <= 0;
			R2 <= 0;
			R3 <= 0;
			R4 <= 0;
			R5 <= 0;
			R6 <= 0;
			R7 <= 0;
		end
		else if (LD) begin
			case(DR)
				3'b000: R0 <= D_in;
				3'b001: R1 <= D_in;
				3'b010: R2 <= D_in;
				3'b011: R3 <= D_in;
				3'b100: R4 <= D_in;
				3'b101: R5 <= D_in;
				3'b110: R6 <= D_in;
				3'b111: R7 <= D_in;
			endcase
		end
		else begin
			R0 <= R0;
			R1 <= R1;
			R2 <= R2;
			R3 <= R3;
			R4 <= R4;
			R5 <= R5;
			R6 <= R6;
			R7 <= R7;
		end
			
  end
 endmodule