library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_counter is
    port (
        Q   : out std_logic_vector(2 downto 0);
        Clk : in std_logic;
        RS  : in std_logic
    );
end sync_counter;

architecture sims of async_counter is
    signal counter : unsigned(2 downto 0);
begin
    process (Clk, RS)
    begin  
		if (rising_edge(Clk) ) then
        if RS = '1' then
            counter <= (others => '0');
        else
            counter <= counter + 1;
        end if;	
		end if;
    end process;

    Q <= std_logic_vector(counter); -- assign internal signal to output
end sims;
