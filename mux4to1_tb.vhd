library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture sims of mux_tb is	  
signal        input  : std_logic_vector(3 downto 0);
signal        sel    : std_logic_vector(1 downto 0);
signal        output : std_logic;
begin	
	
	mux : entity work.mux
		port map (
		input  => input ,
        sel    => sel ,
        output => output 
		); 
		
		
		
		process
		begin 
			input <= "1001";
			
			sel <= "00" ;
			wait for 5ns;
			assert (output = '1') report "failes for 00" severity error;
				
				sel <= "01" ;
				wait for 5ns;
				assert (output = '0') report "failes for 01" severity error;
					
				sel <= "10"	;
				wait for 5ns;
				assert (output = '0') report "failes for 10" severity error;
					
				sel <= "11"	;
				wait for 5ns;
				assert (output = '1') report "failes for 11" severity error;
					
					wait;
		end process;
	
end sims;
