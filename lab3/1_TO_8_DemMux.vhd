library ieee;
use ieee.std_logic_1164.all;

entity demux is   
	port(
		sel : in std_logic_vector(2 downto 0); -- Selector (3-bit)
		input  : in std_logic; -- Single input to be routed
		D   : out std_logic_vector(7 downto 0) -- 8 output lines
	);
end entity;  

architecture rtl of demux is
begin	
	with sel select
		D <= "00000001" when "000",  -- IN goes to D(0)
		     "00000010" when "001",  -- IN goes to D(1)
		     "00000100" when "010",  -- IN goes to D(2)
		     "00001000" when "011",  -- IN goes to D(3)
		     "00010000" when "100",  -- IN goes to D(4)
		     "00100000" when "101",  -- IN goes to D(5)
		     "01000000" when "110",  -- IN goes to D(6)
		     "10000000" when "111",  -- IN goes to D(7)
		     "XXXXXXXX" when others; -- Undefined state for invalid `sel`
end architecture;
