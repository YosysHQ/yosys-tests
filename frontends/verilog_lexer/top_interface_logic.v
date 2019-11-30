interface apb_if (input pclk);
  logic [31:0]    paddr;
  logic [31:0]    pwdata;
  logic [31:0]    prdata;
  logic           penable;
  logic           pwrite;
  logic           psel;

  modport TB  (input penable, output psel);
endinterface

module mux2 (S,A,B,Y);
    input S;
    input A,B;
    output reg Y;

    always @(*)
		Y = (S)? B : A;
endmodule
