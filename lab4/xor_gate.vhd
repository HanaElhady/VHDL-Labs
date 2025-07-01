library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is	   
	port(
	A , B : in std_logic;
	C :out std_logic
	);
end entity;

architecture sims of xor_gate is
begin
	C<= A XOR B ;
end architecture;