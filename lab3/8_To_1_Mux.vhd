library ieee;
use ieee.std_logic_1164.all;

entity mux is  
	port(
	M: in std_Logic_vector(7 downto 0);
	sel:in std_logic_vector(2 downto 0 );
	output : out std_logic	
	);
end entity;

architecture rtl of mux is
begin
	with sel select
	output <= m(0) when "000",
			  m(1) when "001",
	 		  m(2) when "010",
			  m(3) when "011",
 			  m(4) when "100",
 			  m(5) when "101",
			  m(6) when "110",
			  m(7) when "111",
			  'X' when others; 
end architecture;
