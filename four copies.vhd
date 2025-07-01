library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cc is
    port(
        clk, reset: in std_logic;
        A: in std_logic_vector(7 downto 0);
        minVal, minCount: out std_logic_vector(7 downto 0)
    );
end entity;

architecture ss of cc is
begin
    process(clk)
        variable min: std_logic;
        variable count: integer := 0;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                minVal <= (others => '0');
                minCount <= (others => '0');
            else
                min := A(0);
                count := 1;

                for i in 1 to 7 loop
                    if A(i) < min then
                        min := A(i);
                        count := 1;
                    elsif A(i) = min then
                        count := count + 1;
                    end if;
                end loop;

                minVal <= (others => min);
                minCount <= std_logic_vector(to_unsigned(count, 8));
            end if;
        end if;
    end process;
end architecture;

