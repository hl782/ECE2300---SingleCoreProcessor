module shifter(A, Y, C, LA, LR); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input LA, LR;

  // outputs
  output [7:0] Y;
  output C;

  // reg and internal variable definitions
  wire SI = 1'b0;

  // implement module here
  assign Y[0] = LR ? A[1] : SI;
  assign Y[1] = LR ? A[2] : A[0];
  assign Y[2] = LR ? A[3] : A[1];
  assign Y[3] = LR ? A[4] : A[2];
  assign Y[4] = LR ? A[5] : A[3];
  assign Y[5] = LR ? A[6] : A[4];
  assign Y[6] = LR ? (A[7]) : A[5];
  assign Y[7] = LR ? (LA ? A[7] : SI) : A[6];
  assign C = LR ? A[0] : A[7];

  
endmodule
