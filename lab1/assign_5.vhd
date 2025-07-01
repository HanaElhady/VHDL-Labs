library ieee;
use ieee.std_logic_1164.all;

entity assign_4 is 
	generic(
	n : integer := 4
	);
	port(
	x,y : in std_logic_vector(n-1 downto 0);	
	cin : in std_logic;
	sum : out std_logic_vector(n-1 downto 0);
	cout : out std_logic
	);									 
end assign_4 ;


