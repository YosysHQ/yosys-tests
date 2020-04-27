typedef enum logic [1:0] {
	ts0, ts1, ts2, ts3
} states_t;
module top(input clk, input states_t din, output states_t dout);
states_t r;
always @(posedge clk) begin
	r <= din;
	dout <= r;
end
endmodule
