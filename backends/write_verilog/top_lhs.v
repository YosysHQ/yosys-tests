module top();
wire [1:2] b;
wire [3:1] c;
wire f;
assign {b, f} = c;
endmodule
