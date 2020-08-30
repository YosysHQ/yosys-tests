
library ieee;
use ieee.std_logic_1164.all;
entity top is
	port (clk : in std_logic; din : in boolean; dout : out boolean);
end entity;

architecture arch of top is
	signal r : boolean;
begin
	process (clk)
	begin
	if rising_edge(clk) then
		r <= din;
		dout <= r;
	end if;
	end process;
end arch;
