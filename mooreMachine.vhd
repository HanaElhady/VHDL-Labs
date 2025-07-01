library ieee;
use ieee.std_logic_1164.all;

entity mooreMachine is
	port(
	rst,clk,w : in std_logic;
	z         : out std_logic
	);					   
	
end mooreMachine;

architecture rtl of mooreMachine is	 
type states is (A,B,C);
signal current_state , next_state : states;
begin
	 
state_process : process(clk,rst) 
begin
if (rst = '1' )	 then
	current_state <= A;
elsif (rising_edge(clk)) then
	current_state <= next_state; 
end if;	 
end process;


next_state_pocess : process(current_state,w) 
begin	   
	next_state <= current_state;
case current_state is
	when A  => 
	if w = '1' then
		next_state <= B;
	end if;
	
	when B =>	  
	if(w = '0' ) then 
		next_state <= A ;
	else 
		next_state <= C;
	end if;
	
		
	when C=>  
	if(w = '0') then
		next_state <= A;
	END IF;	 
	END CASE;
	
end process;


output_state_process : PROCESS(current_state)
begin
	case current_state is 
		when A | B =>
		z <= '0';
		when C =>
		z <= '1';
	end case;  
	end process;
	
end rtl;