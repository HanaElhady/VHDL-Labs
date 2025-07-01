library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_loop is	
    generic (
        n : integer := 4
    );
    port (
        shift : in std_logic;
        CLK   : in std_logic;
        w     : in std_logic;
        Y     : inout std_logic_vector(n-1 downto 0)
    );
end shift_register_loop;

architecture sims of shift_register_loop is
begin	 
	process 
    begin  
        wait until rising_edge(CLK);
            if shift = '1' then
				for i in 0 to n-2 loop		 
					Y(i) <= Y(i+1);
				end loop;  
				Y(n-1) <= w;
            end if;	 
		
        end process;
end sims;
