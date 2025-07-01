library ieee;
use ieee.std_logic_1164.all;


entity mealy_machine is
	port (
	clk, x : in std_logic;
	z : out std_logic
	);
end entity;

architecture rtl of mealy_machine is	
type states is(A,B,C);
signal current_state , next_state : states;
begin
	
states_process : process(clk) 
begin
	if(rising_edge(clk)) then	
		current_state <= next_state;
		
	end if;
		
end process; 

next_state_process : process(next_state,x)
begin
	next_state <= current_state;
	case current_state is
		when A =>
		if(x = '1') then
			next_state <= B; 
			end if;
			when B =>
			if(x ='0')	then
				next_state <= A;
			else
				next_state <= C;
				end if;
				when C =>
				if(x = '1')	then
					next_state <= A;   
					end if;
				end  case;
				
					
end process; 

output_process: process(current_state, x)  
begin
case current_state is
	when A =>
		z <= '0';
	when B | c =>	  
		z <= x;
	
end case; 
end process;
		


end architecture;