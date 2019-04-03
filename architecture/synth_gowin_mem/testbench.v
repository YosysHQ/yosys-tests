module testbench;
    reg clk;

    initial begin
        // $dumpfile("testbench.vcd");
        // $dumpvars(0, testbench);

        #5 clk = 0;
        repeat (10000) begin
            #5 clk = 1;
            #5 clk = 0;
        end

        $display("OKAY");
    end


    reg [7:0] data_a = 0;
	reg [5:0] addr_a = 0;
    reg we_a = 0;
	wire [7:0] q_a;
	reg mem_init = 0;

    top uut (
    data_a[0],
    data_a[1],
    data_a[2],
    data_a[3],
    data_a[4],
    data_a[5],
    data_a[6],
    data_a[7],
	addr_a[0],
	addr_a[1],
	addr_a[2],
	addr_a[3],
	addr_a[4],
	addr_a[5],
	we_a,
	clk,
	q_a[0],
	q_a[1],
	q_a[2],
	q_a[3],
	q_a[4],
	q_a[5],
	q_a[6],
	q_a[7]
    );

    always @(posedge clk) begin
    #3;
    data_a <= data_a + 17;

    addr_a <= addr_a + 1;
    end

    always @(posedge addr_a) begin
    #10;
        if(addr_a > 6'h3E)
            mem_init <= 1;
    end

	always @(posedge clk) begin
    //#3;
    we_a <= !we_a;
    end

	uut_mem_checker port_a_test(.clk(clk), .init(mem_init), .en(!we_a), .A(q_a));

endmodule

module uut_mem_checker(input clk, input init, input en, input [7:0] A);
    always @(posedge clk)
    begin
        #1;
        if (en == 1 & init == 1 & A === 8'bXXXXXXXX)
        begin
            $display("ERROR: ASSERTION FAILED in %m:",$time," ",A);
            $stop;
        end
    end
endmodule
