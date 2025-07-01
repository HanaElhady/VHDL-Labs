library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE is	
	PORT (
	A ,B : in std_logic;
    C : out std_logic
    
    );
end OR_GATE;

architecture sims of OR_GATE is	 

begin		
	
	C <=  A OR B;
end sims;
