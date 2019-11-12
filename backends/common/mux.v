module top ( S, D, Y );
    input[2:0] S;
    input[7:0] D;
    output Y;

    reg Y;
    wire[2:0] S;
    wire[7:0] D;

    always @*
    begin
        case( S )
            0 : Y = D[0];
            1 : Y = D[1];
            2 : Y = D[2];
            3 : Y = D[3];
            4 : Y = D[4];
            5 : Y = D[5];
            6 : Y = D[6];
            7 : Y = D[7];
        endcase
    end
endmodule
