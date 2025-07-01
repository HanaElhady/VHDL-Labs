library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
    port(
        binary_input : in std_logic_vector(1 downto 0);
        en           : in std_logic;
        decimal_output : out std_logic_vector(3 downto 0)
    );
end dec2to4;

architecture sims of dec2to4 is
begin
    process(en, binary_input)
    begin
        if (en = '1') then
            case binary_input is
                when "00" => decimal_output <= "0001";
                when "01" => decimal_output <= "0010";
                when "10" => decimal_output <= "0100";
                when "11" => decimal_output <= "1000";
                when others => decimal_output <= "0000"; -- safety fallback
            end case;
        else
            decimal_output <= "0000";
        end if;
    end process;
end sims;
