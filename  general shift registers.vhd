library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_general is	
    generic (
        n : integer := 4
    );
    port (
        shift : in std_logic;
        CLK   : in std_logic;
        w     : in std_logic;
        Y     : inout std_logic_vector(n-1 downto 0)
    );
end shift_register_general;

architecture sims of shift_register_general is
begin
    process (CLK)
    begin  
        if rising_edge(CLK) then
            if shift = '1' then
                Y <= Y(n-2 downto 0) & w;
            end if;
        end if;
    end process;
end sims;
