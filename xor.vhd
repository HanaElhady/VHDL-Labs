library ieee;
use ieee.std_logic_1164.all;

entity xor_GATE is	
	PORT (
	A ,B : in std_logic;
    C : out std_logic
    
    );
end xor_GATE;

architecture sims of xor_GATE is	 

begin		
	
	C <=  A XOR B;
end sims;
