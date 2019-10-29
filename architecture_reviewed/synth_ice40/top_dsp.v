(* top *)
module top #(parameter AW=8, BW=8, AREG=1, BREG=1, PREG=1) (input clk, CEA, CEB, CEP, input [AW-1:0] A, input [BW-1:0] B, (* keep *) output reg [AW+BW-1:0] P);
(* keep *) reg [AW-1:0] Ar;
(* keep *) reg [BW-1:0] Br;
generate
    if (AREG) begin
        always @(posedge clk) if (1) Ar <= A;
    end
    else
        always @* Ar <= A;
    if (BREG) begin
        always @(posedge clk) if (1) Br <= B;
    end
    else
        always @* Br <= B;
    if (PREG) begin
        always @(posedge clk) if (1) P <= Ar * Br;
    end
    else
        always @* P <= Ar * Br;
endgenerate
endmodule
