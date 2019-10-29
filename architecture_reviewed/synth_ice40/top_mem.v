module top
(
	input [7:0] data_a,
	input [6:1] addr_a,
	input we_a, clk,
	output reg [7:0] q_a,
	output reg [15:0] q_b,
	output reg [15:0] q_c
);

	SB_RAM40_4K #(
    .READ_MODE(2'h1),
    .WRITE_MODE(2'h1),
    .INIT_FILE("../init.txt")
  ) \ram.0.0.0  (
    .MASK(16'hxxxx),
    .RADDR({ 5'h00, addr_a }),
    .RCLK(clk),
    .RCLKE(1'h1),
    .RDATA(q_b),
    .RE(1'h1),
    .WADDR({ 5'h00, addr_a }),
    .WCLK(clk),
    .WCLKE(we_a),
    .WDATA({ 1'hx, data_a[7], 1'hx, data_a[6], 1'hx, data_a[5], 1'hx, data_a[4], 1'hx, data_a[3], 1'hx, data_a[2], 1'hx, data_a[1], 1'hx, data_a[0] }),
    .WE(1'h1)
  );

  	SB_RAM40_4K #(
    .READ_MODE(2'h1),
    .WRITE_MODE(2'h1),
    .INIT_FILE("../init1.txt")
  ) \ram.0.0.1  (
    .MASK(16'hxxxx),
    .RADDR({ 5'h00, addr_a }),
    .RCLK(clk),
    .RCLKE(1'h1),
    .RDATA(q_c),
    .RE(1'h1),
    .WADDR({ 5'h00, addr_a }),
    .WCLK(clk),
    .WCLKE(we_a),
    .WDATA({ 1'hx, data_a[7], 1'hx, data_a[6], 1'hx, data_a[5], 1'hx, data_a[4], 1'hx, data_a[3], 1'hx, data_a[2], 1'hx, data_a[1], 1'hx, data_a[0] }),
    .WE(1'h1)
  );

endmodule
