module logical(A, B, LOGICAL_OP, Y); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input LOGICAL_OP;
  
  // outputs
  output reg [7:0] Y;
  
  // reg and internal variable definitions
  // implement module here

  always@(*) begin
  	if(LOGICAL_OP == 1'b1) Y = A & B;
  	else Y = A | B;
  end

  
endmodule