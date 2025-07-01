library ieee;
use ieee.std_logic_1164.all;

entity mux16to1  is
    port(
        input  : in std_logic_vector(15 downto 0);
        sel    : in std_logic_vector(3 downto 0);
        output : out std_logic
    );
end mux16to1;

architecture sims of mux16to1  is		 
signal intern : std_logic_vector(3 downto 0);
begin
  left_mux : for i in 0 to 3 generate
	  mux: entity work.mux 
		  port map (
		  	  input  => input(4*i+3 downto 4*i),
        sel => sel(1 downto 0) ,   
        output => intern(i) 
		);	  	
		end generate;
		
		right_mux: entity work.mux
			port map (
			input  => intern,
        sel => sel(3 downto 2) ,   
        output => output 
		);
end sims;
