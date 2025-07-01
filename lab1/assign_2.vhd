library ieee;
use ieee.std_logic_1164.all;

entity assign_2 is 
	generic( 
	n : integer := 8
	);
	port(
	clk,rst,en: in std_logic;
	data : in std_logic_vector((n-1) downto 0);
	q : out std_logic_vector((n-1) downto 0)
	);									 
end assign_2 ;
