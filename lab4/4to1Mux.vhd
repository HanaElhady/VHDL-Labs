library ieee;
use ieee.std_logic_1164.all;

entity Mux4to1 is
	port(	
	s: in std_logic_vector(1 downto 0);
	y: in std_logic_vector(3 downto 0);
	output: out std_logic
	);
end entity;

architecture sims of Mux4to1 is
begin 
	with s select
	output <= y(0) when "00",	
	y(1) when "01",
	y(2) when "10",
	y(3) when others;
	
end architecture;
