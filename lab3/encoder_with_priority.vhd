library ieee;
use ieee.std_logic_1164.all;

entity encoderWithPriority is   
    port(
        I : in std_logic_vector(7 downto 0);  
        priority: in std_logic;
        output: out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of encoderWithPriority is 
begin
    process (I)
    begin
        if I(7) = '1' then
            output <= "111";
        elsif I(6) = '1' then
            output <= "110";
        elsif I(5) = '1' then
            output <= "101";
        elsif I(4) = '1' then
            output <= "100";
        elsif I(3) = '1' then
            output <= "011";
        elsif I(2) = '1' then
            output <= "010";
        elsif I(1) = '1' then
            output <= "001";
        elsif I(0) = '1' then
            output <= "000";
        else
            output <= "XXX"; 
        end if;
    end process;
end architecture;
