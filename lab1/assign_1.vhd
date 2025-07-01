library ieee;
use ieee.std_logic_1164.all;

entity assign_1 is
	port(
	clk,rst,en: in std_logic;
	data : in std_logic_vector(7 downto 0);
	q : out std_logic_vector(7 downto 0)
	);									 
end assign_1 ;
