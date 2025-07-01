library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity adder is
	port(
	x,y : in signed(15 downto 0);
	sum : out signed(15 downto 0)
	);
end adder;			   

architecture sim of adder is
begin
	sum <= x+y;
end sim;

