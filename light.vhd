library ieee;
use ieee.std_logic_1164.all;

entity light is
	
	port (
	clk , rst : in std_logic;
	rNorth, yNorth ,gNorth , rWest,yWest,gWest : out std_logic
	);				 
end entity;

architecture sims of light is
type states is(startNorth , north , stopNorth , westNext,startWest,west,stopWest,northNext);
signal currentState ,nextState : states;
begin 
	
	process(clk,rst)
	begin
		if(rst = '1') then
			currentState <= northNext;
		elsif (rising_edge(clk)) then
			
				currentState <= nextState;
	
		end if;
		end process;
		
		process(currentState) 
		begin
			case currentState is
			
			when startNorth => 
			nextState <= north;
			
			when north => 
			nextState <= stopNorth;
			
			when stopNorth => 
			nextState <= westNext;
			
			when westNext => 
			nextState <= startWest;	
			
			when startWest => 
			nextState <= west;	
			
			when west => 
			nextState <= stopWest;	 
			
			when stopWest => 
			nextState <= northNext;
			
			when northNext => 
			nextState <= startNorth;   
			
			end case;
		end process;
		
		process(currentState) 
		begin
			case currentState is
			
			when startNorth => 
			rNorth <= '1';
			yNorth <= '1';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '0';
			gWest  <= '0';
			
			when north => 
			rNorth <= '0';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '0';
			gWest  <= '0';
			
			when stopNorth => 
			rNorth <= '0';
			yNorth <= '1';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '0';
			gWest  <= '0';
			
			when westNext => 
			rNorth <= '1';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '0';
			gWest  <= '0';
			
			when startWest => 
			rNorth <= '1';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '1';
			gWest  <= '0';	
			
			when west => 
			rNorth <= '1';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '0';
			yWest  <= '0';
			gWest  <= '1';	 
			
			when stopWest => 
			rNorth <= '1';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '0';
			yWest  <= '1';
			gWest  <= '0';
			
			when northNext => 
			rNorth <= '1';
			yNorth <= '0';
			gNorth <= '0';
			rWest  <= '1';
			yWest  <= '0';
			gWest  <= '0';   
			
			end case;
		end process;
	end architecture;
	
		
	