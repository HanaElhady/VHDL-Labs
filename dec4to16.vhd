library ieee;
use ieee.std_logic_1164.all;

entity dec4to16 is
    port(
        binary_input : in std_logic_vector(3 downto 0);
        en           : in std_logic;
        decimal_output : out std_logic_vector(15 downto 0)
    );
end;

architecture sims of dec4to16 is  
signal internal : std_logic_vector(3 downto 0);
begin
   right_dec : entity work.dec2to4    
	   port map(
	   binary_input => binary_input(3 downto 2) ,
	   en => en,
	   decimal_output => internal
	   );  
	   
	   gen : for i in 0 to 3 generate
	   left_dec : entity work.dec2to4 
		   port map(  
		   	  binary_input => binary_input(1 downto 0) ,
	   		  en => internal(i),
	  		  decimal_output => decimal_output((4*i)+3 downto 4*i)
		   );		  
	   end generate;
	   
end;
