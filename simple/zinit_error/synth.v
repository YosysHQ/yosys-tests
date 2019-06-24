/* Generated by Yosys 0.8+492 (git sha1 2058c7c5, gcc 8.3.0-6ubuntu1~18.10 -Og -fPIC) */

(* cells_not_processed =  1  *)
(* src = "../top.v:1" *)
module adff(d, clk, clr, q);
  (* src = "../top.v:6" *)
  wire _0_;
  (* src = "../top.v:3" *)
  wire _1_;
  (* src = "../top.v:2" *)
  input clk;
  (* src = "../top.v:2" *)
  input clr;
  (* src = "../top.v:2" *)
  input d;
  (* init = 1'h0 *)
  (* src = "../top.v:2" *)
  output q;
  reg q = 1'h0;
  always @(posedge clk or posedge clr)
    if (clr)
      q <= 1'h0;
    else
      q <= d;
  assign _1_ = 1'h0;
  assign _0_ = d;
endmodule

(* cells_not_processed =  1  *)
(* src = "../top.v:17" *)
module adffn(d, clk, clr, q);
  (* src = "../top.v:22" *)
  wire _0_;
  (* src = "../top.v:19" *)
  wire _1_;
  (* src = "../top.v:23" *)
  wire _2_;
  (* src = "../top.v:18" *)
  input clk;
  (* src = "../top.v:18" *)
  input clr;
  (* src = "../top.v:18" *)
  input d;
  (* init = 1'h0 *)
  (* src = "../top.v:18" *)
  output q;
  reg q = 1'h0;
  assign _2_ = ! (* src = "../top.v:23" *) clr;
  always @(posedge clk or negedge clr)
    if (!clr)
      q <= 1'h0;
    else
      q <= d;
  assign _1_ = 1'h0;
  assign _0_ = d;
endmodule

(* cells_not_processed =  1  *)
(* src = "../top.v:33" *)
module dffe(d, clk, en, q);
  (* src = "../top.v:38" *)
  wire _0_;
  (* src = "../top.v:35" *)
  wire _1_;
  wire _2_;
  wire _3_;
  wire _4_;
  (* src = "../top.v:34" *)
  input clk;
  (* src = "../top.v:34" *)
  input d;
  (* src = "../top.v:34" *)
  input en;
  (* init = 1'h0 *)
  (* src = "../top.v:34" *)
  output q;
  reg q = 1'h0;
  assign _2_ = en != 1'h0;
  always @(posedge clk)
    if (_2_)
      q <= _3_;
  assign _3_ = _4_ ? (* src = "../top.v:39" *) d : 1'hx;
  assign _1_ = 1'h0;
  assign _4_ = en;
  assign _0_ = _3_;
endmodule

(* cells_not_processed =  1  *)
(* src = "../top.v:47" *)
module dffsr(d, clk, pre, clr, q);
  (* src = "../top.v:52" *)
  wire _00_;
  (* src = "../top.v:49" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  (* src = "../top.v:48" *)
  input clk;
  (* src = "../top.v:48" *)
  input clr;
  (* src = "../top.v:48" *)
  input d;
  (* src = "../top.v:48" *)
  input pre;
  (* init = 1'h0 *)
  (* src = "../top.v:48" *)
  output q;
  assign _02_ = ~ 1'h1;
  assign _03_ = ~ 1'h0;
  assign _04_ = pre ? 1'h1 : 1'h0;
  assign _05_ = clr ? 1'h0 : _04_;
  assign _06_ = pre ? _02_ : 1'h0;
  assign _07_ = clr ? _03_ : _06_;
  reg [0:0] _14_ = 1'h0;
  always @(posedge clk, posedge _05_, posedge _07_)
    if (_07_) _14_[0] <= 1'b0;
    else if (_05_) _14_[0] <= 1'b1;
    else  _14_[0] <= d;
  assign q = _14_;
  assign _01_ = 1'h0;
  assign _00_ = d;
endmodule

(* cells_not_processed =  1  *)
(* src = "../top.v:65" *)
module ndffnsnr(d, clk, pre, clr, q);
  (* src = "../top.v:70" *)
  wire _00_;
  (* src = "../top.v:67" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "../top.v:71" *)
  wire _10_;
  (* src = "../top.v:77" *)
  wire _11_;
  (* src = "../top.v:66" *)
  input clk;
  (* src = "../top.v:66" *)
  input clr;
  (* src = "../top.v:66" *)
  input d;
  (* src = "../top.v:66" *)
  input pre;
  (* init = 1'h0 *)
  (* src = "../top.v:66" *)
  output q;
  assign _02_ = ~ 1'h1;
  assign _03_ = ~ 1'h0;
  assign _04_ = _08_ ? 1'h1 : 1'h0;
  assign _05_ = _09_ ? 1'h0 : _04_;
  assign _06_ = _08_ ? _02_ : 1'h0;
  assign _07_ = _09_ ? _03_ : _06_;
  assign _08_ = ~ pre;
  assign _09_ = ~ clr;
  assign _10_ = ! (* src = "../top.v:71" *) clr;
  assign _11_ = ! (* src = "../top.v:77" *) pre;
  reg [0:0] _22_ = 1'h0;
  always @(negedge clk, posedge _05_, posedge _07_)
    if (_07_) _22_[0] <= 1'b0;
    else if (_05_) _22_[0] <= 1'b1;
    else  _22_[0] <= d;
  assign q = _22_;
  assign _01_ = 1'h0;
  assign _00_ = d;
endmodule

(* cells_not_processed =  1  *)
(* src = "../top.v:83" *)
module top(clk, clr, pre, a, b, b1, b2, b3, b4);
  (* src = "../top.v:87" *)
  input a;
  (* src = "../top.v:88" *)
  output b;
  (* src = "../top.v:88" *)
  output b1;
  (* src = "../top.v:88" *)
  output b2;
  (* src = "../top.v:88" *)
  output b3;
  (* src = "../top.v:88" *)
  output b4;
  (* src = "../top.v:84" *)
  input clk;
  (* src = "../top.v:85" *)
  input clr;
  (* src = "../top.v:86" *)
  input pre;
  (* module_not_derived = 32'd1 *)
  (* src = "../top.v:107" *)
  adff u_adff (
    .clk(clk),
    .clr(clr),
    .d(a),
    .q(b2)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "../top.v:114" *)
  adffn u_adffn (
    .clk(clk),
    .clr(clr),
    .d(a),
    .q(b3)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "../top.v:121" *)
  dffe u_dffe (
    .clk(clk),
    .d(a),
    .en(clr),
    .q(b4)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "../top.v:91" *)
  dffsr u_dffsr (
    .clk(clk),
    .clr(clr),
    .d(a),
    .pre(pre),
    .q(b)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "../top.v:99" *)
  ndffnsnr u_ndffnsnr (
    .clk(clk),
    .clr(clr),
    .d(a),
    .pre(pre),
    .q(b1)
  );
endmodule
