(* black_box *) module mux2 (S,A,B,Y);
    input S;
    input A,B;
    output reg Y;

    always @(*)
		Y = (S)? B : A;
endmodule

(* white_box *) module mux4 ( S, D, Y );

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
