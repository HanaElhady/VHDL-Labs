library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_down_counter is
    port (
        Q   : out std_logic_vector(3 downto 0);
        Clk : in std_logic;
        RS  : in std_logic
    );
end bcd_down_counter;

architecture sims of bcd_down_counter is
    signal counter : unsigned(3 downto 0);
begin
    process (Clk, RS)
    begin
        if RS = '1' then
            counter <= (others => '0');
        elsif rising_edge(Clk) then
            if counter = to_unsigned(0, 4) then
                counter <= (3 | 0 => '1' , others => '0');
            else
                counter <= counter - 1;
            end if;
        end if;
    end process;

    Q <= std_logic_vector(counter); -- assign internal signal to output
end sims;
