    cell $mem \ram
    parameter \ABITS 6
    parameter \INIT 512'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    parameter \MEMID "\\ram"
    parameter \OFFSET 0
    parameter \RD_CLK_ENABLE 2'00
    parameter \RD_CLK_POLARITY 2'00
    parameter \RD_PORTS 2
    parameter \RD_TRANSPARENT 2'00
    parameter \SIZE 64
    parameter \WIDTH 8
    parameter \WR_CLK_ENABLE 2'11
    parameter \WR_CLK_POLARITY 2'11
    parameter \WR_PORTS 2
    connect \RD_ADDR { \addr_b \addr_a }
    connect \RD_CLK 2'xx
    connect \RD_DATA { $memrd$\ram$../top_mem.v:40$12_DATA $memrd$\ram$../top_mem.v:26$7_DATA }
    connect \RD_EN 2'xx
    connect \WR_ADDR { $0$memwr$\ram$../top_mem.v:35$2_ADDR[5:0]$9 $0$memwr$\ram$../top_mem.v:21$1_ADDR[5:0]$4 }
    connect \WR_CLK { \clkb \clka }
    connect \WR_DATA { $0$memwr$\ram$../top_mem.v:35$2_DATA[7:0]$10 $0$memwr$\ram$../top_mem.v:21$1_DATA[7:0]$5 }
    connect \WR_EN { $0$memwr$\ram$../top_mem.v:35$2_EN[7:0]$11 $0$memwr$\ram$../top_mem.v:21$1_EN[7:0]$6 }
  end
