library ieee;
use ieee.std_logic_1164.all;

entity AND_GATE is	
	PORT (
	A ,B : in std_logic;
    C : out std_logic
    
    );
end AND_GATE;

architecture sims of AND_GATE is	 

begin		
	
	C <=  A AND B;
end sims;
