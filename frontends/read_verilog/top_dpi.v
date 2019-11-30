package my_pkg;
	localparam u = 0;
endpackage


module tb_dpi;

  import "DPI-C" function int add();
	wire logic w;

endmodule

module hello();
    import "DPI-C" function void print_hello();
endmodule
