module  test (output reg [3:0] out);
        integer k;
        initial begin
                out = 0;
                for(k=0; k<16; k=k+1)
                        if (k[0]) out = out + 1;
        end
endmodule