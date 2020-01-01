module top (addr, ce, q, clk);

input clk;
input [9:0] addr;
input ce;
output reg [7:0] q;

reg [7:0] ram[1023:0];
integer j;

// memory not created if there is no initial content
initial 
for(j = 0; j < 256; j = j+1) 
    ram[j] = 8'h00;
    
always @(posedge clk)
begin
    if (ce)
    begin
        q <= ram[addr];
    end
end

endmodule
