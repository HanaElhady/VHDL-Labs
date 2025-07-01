library ieee;
use ieee.std_logic_1164.all;

entity or_gate is	   
	port(
	A , B : in std_logic;
	C :out std_logic
	);
end entity;

architecture sims of or_gate is
begin
	C<= A 		or B ;
end architecture;