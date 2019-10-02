module assert_Z(input clk, input A);
    always @(posedge clk)
    begin
        //#1;
        if (A === 1'bZ)
        begin
            $display("ERROR: ASSERTION FAILED in %m:",$time," ",A);
            $stop;
        end
    end
endmodule
