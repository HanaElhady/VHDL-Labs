library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
    port (
        w  : in std_logic_vector(1 downto 0);
        y  : out std_logic_vector(3 downto 0);
        en : in std_logic
    );
end entity;

architecture sim of dec2to4 is
begin
    process(w, en)
    begin
        if en = '1' then
            case w is
                when "00" => y <= "0001";
                when "01" => y <= "0010";
                when "10" => y <= "0100";
                when "11" => y <= "1000";
                when others => y <= "0000";
            end case;
        else
            y <= "0000"; 
        end if;
    end process;
end architecture;
