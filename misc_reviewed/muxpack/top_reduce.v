module mux (D, S, Y);
 	input  [7:0] D;
 	input  [3:0] S;
 	output Y;

reg Y;
wire[3:0] S;
wire[7:0] D;

always @*
     begin
        case( S )
            0,1 : Y = D[0];
            2,3 : Y = D[1];
            4,5 : Y = D[2];
            6,7 : Y = D[3];
            8,9 : Y = D[4];
            10,11 : Y = D[5];
            12,13 : Y = D[6];
            14,15 : Y = D[7];
            default: Y = 1'bx;
        endcase
     end

endmodule

module mux4 ( S, D, Y );

input[1:0] S;
input[3:0] D;
output Y;

reg Y;
wire[1:0] S;
wire[3:0] D;

always @*
    if (S != 0) Y <= D[0];
    else if (S != 1) Y <= D[1];
    else if (S != 2) Y <= D[2];
    else if (S != 3) Y <= D[3];
    else Y <= 1'bx;

endmodule

