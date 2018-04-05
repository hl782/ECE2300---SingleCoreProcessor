module control(OP, BSEL, OSEL, CISEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;
  
  // outputs (add others here)
  output reg CISEL, BSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP;
  output reg [1:0] OSEL;

  // reg and internal variable definitions
  parameter [2:0] ADD = 3'b000,
						SUB = 3'b001,
						SRA = 3'b010,
						SRL = 3'b011,
						SLL = 3'b100,
						AND = 3'b101,
						OR  = 3'b110;
  
  // implement module here (add other control signals below)
  
  always@(*) begin
  	case(OP)
  		ADD: begin
  			BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b00;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b0;
  		end
  		SUB: begin
  			BSEL = 1'b1;
  			CISEL = 1'b1;
  			OSEL = 2'b00;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b0;
  		end
  		SRA: begin
  		  	BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b01;
  			SHIFT_LA = 1'b1;
  			SHIFT_LR = 1'b1;
  			LOGICAL_OP = 1'b0;
  		end
  		SRL: begin
  		  	BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b01;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b1;
  			LOGICAL_OP = 1'b0;
  		end
  		SLL: begin
  		  	BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b01;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b0;
  		end
  		AND: begin
  		  	BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b10;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b1;
  		end
  		OR: begin
  		  	BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b10;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b0;
  		end
  		default: begin
  			BSEL = 1'b0;
  			CISEL = 1'b0;
  			OSEL = 2'b00;
  			SHIFT_LA = 1'b0;
  			SHIFT_LR = 1'b0;
  			LOGICAL_OP = 1'b0;
  		end
  	endcase
  end
endmodule