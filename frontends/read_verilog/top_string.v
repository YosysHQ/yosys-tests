module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

parameter FILE_OUT= "\"file1.txt\"";
reg [8*10:1]        stringvar;
reg [7:0] q;

initial begin
stringvar="Starting";
q <= '1;
end

endmodule
