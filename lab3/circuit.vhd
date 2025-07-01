library ieee;
use ieee.std_logic_1164.all;

entity circuit is
    port(
        I : in std_logic_vector(7 downto 0);  -- 8-bit input
        f : out std_logic                      -- output
    );
end entity;

architecture rtl of circuit is
    signal x, y, z : std_logic;  -- Signals to hold intermediate values
begin  
    process(I)  -- A single process to handle all logic
    begin
        -- First multiplexer logic
        if I(2) = '0' then
            x <= I(3);
        else
            x <= I(4);
        end if;
        
        -- Second multiplexer logic
        if I(5) = '0' then
            y <= I(6);
        else
            y <= I(7);
        end if;
        
        -- OR gate logic
        z <= I(0) or I(1);  -- OR operation between I(0) and I(1)
        
        -- Final output assignment
        if z = '0' then
            f <= x;
        else
            f <= y;
        end if;
    end process;

end architecture;
