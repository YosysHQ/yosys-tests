module top(
    output reg [7:0] dbr,   // Data bus READ
    input  [7:0] addr,  // Address bus - eight bits
    input  clk          // Clock
    );

    reg [7:0] rom_data[0:255];
    integer j;

    // memory not created if there is no initial content
    initial 
    for(j = 0; j < 256; j = j+1) 
        rom_data[j] = 8'h00;

    always @(posedge clk)
        dbr <= rom_data[addr];

endmodule
