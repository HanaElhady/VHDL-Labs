library ieee;
use ieee.std_logic_1164.all;

entity and_gate is	   
	port(
	A , B : in std_logic;
	C :out std_logic
	);
end entity;

architecture sims of and_gate is
begin
	C<= A AND B ;
end architecture;
