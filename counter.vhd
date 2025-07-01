library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is	
    port (
        x     : in unsigned(2 downto 0);
        count : out unsigned(1 downto 0)
    );
end counter;

architecture sims of counter is
begin
    process(x)
        variable s : unsigned(1 downto 0);
    begin
        s := (others => '0');

        -- Accumulate the first two bits
        for i in 0 to 1 loop
            s := s + resize(x(i downto i), 2);  -- resize from 1-bit to 2-bit
        end loop;

        count <= s + resize(x(2 downto 2), 2);  -- Add x(2) as well, resized to 2 bits
    end process;
end sims;
