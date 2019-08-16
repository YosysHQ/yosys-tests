module testbench;
    reg clk;

    initial begin
         $dumpfile("testbench.vcd");
         $dumpvars(0, testbench);

        #5 clk = 0;
        repeat (10000) begin
            #5 clk = 1;
            #5 clk = 0;
        end

        $display("OKAY");
    end

    function [31:0] xorshift32;
        input [31:0] arg;
        begin
                xorshift32 = arg;
                // Xorshift32 RNG, doi:10.18637/jss.v008.i14
                xorshift32 = xorshift32 ^ (xorshift32 << 13);
                xorshift32 = xorshift32 ^ (xorshift32 >> 17);
                xorshift32 = xorshift32 ^ (xorshift32 <<  5);
        end
    endfunction

    reg [31:0] rng = 123456789;
    always @(posedge clk) rng <= xorshift32(rng);

    wire a = xorshift32(rng * 5);
    wire b = xorshift32(rng * 7);
    reg rst;
    wire g0;
    wire g1;

    top uut (
        .a (a),
        .b (b),
        .clk (clk),
        .rst (rst),
        .g0(g0),
        .g1(g1)
    );

    initial begin
        rst <= 1;
        #5
        rst <= 0;
    end

 reg     gnt_0,gnt_1;
 parameter SIZE = 3           ;
 parameter IDLE  = 3'b001,GNT0 = 3'b010,GNT1 = 3'b100,GNT2 = 3'b101 ;

 reg [SIZE-1:0] state;
 reg [SIZE-1:0] next_state;

 always @ (posedge clk)
 begin : FSM
 if (rst == 1'b1) begin
   state <=  #1  IDLE;
   gnt_0 <= 0;
   gnt_1 <= 0;
 end else
  case(state)
    IDLE : if (a == 1'b1) begin
                 state <=  #1  GNT0;
                 gnt_0 <= 1;
               end else if (b == 1'b1) begin
                 gnt_1 <= 1;
                 state <=  #1  GNT0;
               end else begin
                 state <=  #1  IDLE;
               end
    GNT0 : if (a== 1'b1) begin
                 state <=  #1  GNT0;
               end else begin
                 gnt_0 <= 0;
                 state <=  #1  IDLE;
               end
    GNT1 : if (b == 1'b1) begin
                 state <=  #1  GNT2;
				 gnt_1 <= a;
               end
    GNT2 : if (a == 1'b1) begin
                 state <=  #1  GNT1;
				 gnt_1 <= b;
               end
    default : state <=  #1  IDLE;
 endcase
 end

    assert_dff g0_test(.clk(clk), .test(g0), .pat(gnt_0));
	assert_dff g1_test(.clk(clk), .test(g1), .pat(gnt_1));

endmodule
