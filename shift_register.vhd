library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register is
    port (
        Q   : out std_logic_vector(3 downto 0);
        Clk,input : in std_logic;
        RS  : in std_logic
    );
end shift_register;

architecture sims of shift_register is	
begin
    process (Clk, RS)  
	
    variable q_internal : std_logic_vector(3 downto 0);
    begin
        if RS = '1' then
            q_internal := (others => '0');
        elsif rising_edge(Clk) then	 
            q_internal(3) := q_internal(2);
            q_internal(2) := q_internal(1);
            q_internal(1) := q_internal(0);  
            q_internal(0) := input;
        end if;		
		 Q <= q_internal;
    end process;



end sims;
