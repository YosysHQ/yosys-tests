module mux2 (S,A,B,Y,Y1);
    input S;
    input A,B;
    output reg Y,Y1;

    always_ff @(*)
		Y = (S)? B : A;

    always_latch @(*)
		Y1 = (~S)? B : A;

endmodule

module mux4 ( S, D, Y );

input[1:0] S;
input[3:0] D;
output Y;

reg Y;
wire[1:0] S;
wire[3:0] D;

always @*
begin
    case( S )
       0 : Y = D[0];
       1 : Y = D[1];
       2 : Y = D[2];
       3 : Y = D[3];
   endcase
end

endmodule
