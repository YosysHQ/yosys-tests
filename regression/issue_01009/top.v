(* hello *)
module ABC(i, o);
  input wire i;
  output wire o;

  (* p_hello *)
  parameter p = 0;
  assign o = i;
endmodule
