// Empty top module

module top (hz100, reset, pb, ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0, left, right, red, green, blue);
  input hz100, reset;
  input [20:0] pb;
  output [7:0] ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0, left, right;
  output red, green, blue;

  reg [31:0] entry; // value being entered
  reg [31:0] saved; // saved value to use as a second operand
  reg [4:0]  op; // the selected operation
  reg        displaysaved; // show entry or saved?
  reg        equalpressed; // has equal been pressed?  
  wire [4:0] key;               // outkey of scankey module  
  wire pressed;                 // strobe of scankey module

  scankey sk(.clk(hz100), .reset(reset), .inkeys(pb), .strobe(pressed), .outkey(key));
  
/********************************************************************************/
// This is the mux that causes the same error
  reg [31:0] nextresult;
  always @(*) begin
    case (op)
      0: nextresult <= entry;
      19: nextresult <= saved + entry;
      18: nextresult <= saved - entry;
      default: nextresult <= saved;
    endcase
  end
/********************************************************************************/
  always @(posedge pressed, posedge reset)
  begin
    if (reset) begin
      entry <= 0;
      saved <= 0;
      op <= 0;
      displaysaved <= 0;
      equalpressed <= 0;
    end
    else if (key == 5'b10001 && displaysaved == 0) begin
      entry <= entry >> 4;
    end
    else if (key == 5'b10000) begin
      saved <= nextresult;
      displaysaved <= 1;
      equalpressed <= 1;
    end
    else if (key[4] == 0) begin
      if (equalpressed) begin
        entry <= {28'b0,key[3:0]};
        saved <= 0;
        op <= 0;
        displaysaved <= 0;
        equalpressed <= 0;
      end
      else begin
        if (entry[31:28] == 0)
          entry <= entry << 4 | key;
        displaysaved <= 0;
      end
    end
    else if (key[4] && key[1]) begin
      if (equalpressed == 0)
        saved <= nextresult;
      op <= key;
      displaysaved <= 1;
      entry <= 0;
      equalpressed <= 0;
    end
  end
  assign right = num [31:24];
  
  wire [31:0] num = displaysaved ? saved : entry;
  ssdec s7(.in(num[31:28]), .enable(1'b1), .out(ss7));
  ssdec s6(.in(num[27:24]), .enable(1'b1), .out(ss6));
  ssdec s5(.in(num[23:20]), .enable(1'b1), .out(ss5));
  ssdec s4(.in(num[19:16]), .enable(1'b1), .out(ss4));
  ssdec s3(.in(num[15:12]), .enable(1'b1), .out(ss3));
  ssdec s2(.in(num[11:8]),  .enable(1'b1), .out(ss2));
  ssdec s1(.in(num[7:4]),   .enable(1'b1), .out(ss1));
  ssdec s0(.in(num[3:0]),   .enable(1'b1), .out(ss0));

endmodule

// Add more modules down here...
module ssdec (in, enable, out);
  input [3:0] in;
  input enable;
  output [7:0] out;
  
  assign out = enable ? in == 4'hF ? 8'b01110001 :
                        in == 4'hE ? 8'b01111001 :
                        in == 4'hd ? 8'b01011110 :
                        in == 4'hC ? 8'b00111001 :
                        in == 4'hB ? 8'b01111100 :
                        in == 4'hA ? 8'b01110111 :
                        in == 4'h9 ? 8'b01101111 :
                        in == 4'h8 ? 8'b01111111 :
                        in == 4'h7 ? 8'b00000111 :
                        in == 4'h6 ? 8'b01111101 :
                        in == 4'h5 ? 8'b01101101 :
                        in == 4'h4 ? 8'b01100110 :
                        in == 4'h3 ? 8'b01001111 :
                        in == 4'h2 ? 8'b01011011 :
                        in == 4'h1 ? 8'b00000110 : 8'b00111111 : 8'b0;
endmodule
module scankey (clk, reset, inkeys, strobe, outkey);
  input clk, reset;
  input [19:0] inkeys;
  output strobe;
  output [4:0] outkey;

  reg [1:0] delay;
  always @(posedge clk, posedge reset)
  if (reset)
    delay <= 0;
  else
    delay <= delay << 1 | |inkeys;

  assign strobe = delay[1];
  assign outkey = inkeys [19] ? 5'd19 :
                  inkeys [18] ? 5'd18 :
                  inkeys [17] ? 5'd17 :
                  inkeys [16] ? 5'd16 :
                  inkeys [15] ? 5'd15 :
                  inkeys [14] ? 5'd14 :
                  inkeys [13] ? 5'd13 :
                  inkeys [12] ? 5'd12 :
                  inkeys [11] ? 5'd11 :
                  inkeys [10] ? 5'd10 :
                  inkeys [ 9] ? 5'd9  :
                  inkeys [ 8] ? 5'd8  :
                  inkeys [ 7] ? 5'd7  :
                  inkeys [ 6] ? 5'd6  :
                  inkeys [ 5] ? 5'd5  :
                  inkeys [ 4] ? 5'd4  :
                  inkeys [ 3] ? 5'd3  :
                  inkeys [ 2] ? 5'd2  :
                  inkeys [ 1] ? 5'd1  : 5'd0;
endmodule