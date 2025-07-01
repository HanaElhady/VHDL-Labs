library ieee;
use ieee.std_logic_1164.all;

entity fullAdder_tb is
end fullAdder_tb;

architecture sims of fullAdder_tb is 
signal A ,B , Cin , Cout,SUM :  std_logic;
begin	 
	fullAdder : ENTITY WORK.fullAdder
		port map (
		A => A ,
		B => B , 
		Cin => Cin ,
		Cout => Cout , 
		SUM => SUM 
		);		   
		
		
		process 
		begin
			A <= '1';
			B <= '0';
			cin <= '1';
			wait for 10ns;
			
			assert(SUM = '0' and Cout ='1') report "failed " severity error;
		end process;

end sims;
