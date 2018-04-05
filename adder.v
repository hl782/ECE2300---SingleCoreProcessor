module adder(A, B, CI, Y, CO, V);

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output [7:0] Y;
  //output CO0, CO1, CO2, CO3, CO4, CO5, CO6;
  output V, CO;
  wire [6:0] C;
  
  assign Y[0] = (A[0]^B[0])^CI;
  assign C[0] = (A[0]&B[0])|((A[0]^B[0])&CI);
  assign Y[1] = (A[1]^B[1])^C[0];
  assign C[1] = (A[1]&B[1])|((A[1]^B[1])&C[0]);
  assign Y[2] = (A[2]^B[2])^C[1];
  assign C[2] = (A[2]&B[2])|((A[2]^B[2])&C[1]);
  assign Y[3] = (A[3]^B[3])^C[2];
  assign C[3] = (A[3]&B[3])|((A[3]^B[3])&C[2]);
  assign Y[4] = (A[4]^B[4])^C[3];
  assign C[4] = (A[4]&B[4])|((A[4]^B[4])&C[3]);
  assign Y[5] = (A[5]^B[5])^C[4];
  assign C[5] = (A[5]&B[5])|((A[5]^B[5])&C[4]);
  assign Y[6] = (A[6]^B[6])^C[5];
  assign C[6] = (A[6]&B[6])|((A[6]^B[6])&C[5]);
  assign Y[7] = (A[7]^B[7])^C[6];
  assign CO = (A[7]&B[7])|((A[7]^B[7])&C[6]);

  assign V = (C[6] != CO);

endmodule