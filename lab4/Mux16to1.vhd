library ieee;
use ieee.std_Logic_1164.all;

entity Mux16to1 is
	port(
	s: in std_logic_vector(3 downto 0);
	y: in std_logic_vector(15 downto 0);
	output: out std_logic
	);
end entity;

architecture sims of Mux16to1 is  
signal output_internal : std_logic_vector(3 downto 0);
begin
	mux_left: for i in 0 to 3 generate	   
		mux: entity work.Mux4to1
			port map(
			s => s(1 downto 0),
			y => y(4*(i+1)-1 downto 4*i),
			output => output_internal(i)
			);
		end generate;
		
		mux_right: entity work.Mux4to1
			port map(  
			s(3 downto 2),
			output_internal,
			output
			);
end architecture;
