module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

wire [7:0] temp_a,temp_b;
wire e;

task convert;
input [7:0] temp_in;
output [7:0] temp_out;
begin
   temp_out = (9/5) *( temp_in + 32);
 end
endtask

function  myfunction;
input a, b, c, d;
 begin
   myfunction = ((a+b) + (c-d));
 end
endfunction

always @ (temp_a)
begin
   convert (temp_a, temp_b);
end
assign e = myfunction (a,b,c,d);

endmodule
