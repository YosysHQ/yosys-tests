top	$add$../../common/counter.v:10$2	$add	A	in	\\out
top	$add$../../common/counter.v:10$2	$add	B	in	1
top	$add$../../common/counter.v:10$2	$add	Y	out	$add$../../common/counter.v:10$2_Y
top	$procdff$3	$adff	ARST	in	\\reset
top	$procdff$3	$adff	CLK	in	\\clk
top	$procdff$3	$adff	D	in	$add$../../common/counter.v:10$2_Y \[7:0\]
top	$procdff$3	$adff	Q	out	\\out
