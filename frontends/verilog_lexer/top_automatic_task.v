module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);

task automatic do_things;
  input [31:0] number_of_things;
  reg [31:0] tmp_thing;
endtask

endmodule
