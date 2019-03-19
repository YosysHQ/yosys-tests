// https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug901-vivado-synthesis.pdf

// 8-bit Shift Register
// Rising edge clock
// Active high clock enable
// Concatenation-based template
// File: shift_registers_0.v
module shift_registers_0 (clk, clken, SI, SO);
parameter WIDTH = 32;
input clk, clken, SI;
output SO;
reg [WIDTH-1:0] shreg;
always @(posedge clk)
begin
	if (clken)
		shreg <= {shreg[WIDTH-2:0], SI};
end
assign SO = shreg[WIDTH-1];
endmodule

// 32-bit Shift Register
// Rising edge clock
// Active high clock enable
// For-loop based template
// File: shift_registers_1.v
module shift_registers_1 (clk, clken, SI, SO);
parameter WIDTH = 32;
input clk, clken, SI;
output SO;
reg [WIDTH-1:0] shreg;
integer i;
always @(posedge clk)
begin
    if (clken)
    begin
        for (i = 0; i < WIDTH-1; i = i+1)
            shreg[i+1] <= shreg[i];
        shreg[0] <= SI;
    end
end
assign SO = shreg[WIDTH-1];
endmodule

// 32-bit dynamic shift register.
// Download:
// File: dynamic_shift_registers_1.v
module dynamic_shift_register_1 (CLK, CE, SEL, SI, DO);
parameter SELWIDTH = 5;
input CLK, CE, SI;
input [SELWIDTH-1:0] SEL;
output DO;
localparam DATAWIDTH = 2**SELWIDTH;
reg [DATAWIDTH-1:0] data;
assign DO = data[SEL];
always @(posedge CLK)
 begin
 if (CE == 1'b1)
 data <= {data[DATAWIDTH-2:0], SI};
 end
endmodule
