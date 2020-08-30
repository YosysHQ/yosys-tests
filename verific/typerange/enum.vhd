package pack is
	type states_t is (ts0, ts1, ts2, ts3);
end package;

library ieee;
use ieee.std_logic_1164.all;
use work.pack.all;
entity top is
	port (clk : in std_logic; din : in states_t; dout : out states_t);
end entity;

architecture arch of top is
	signal r : states_t;
begin
	process (clk)
	begin
	if rising_edge(clk) then
		r <= din;
		dout <= r;
	end if;
	end process;
end arch;
