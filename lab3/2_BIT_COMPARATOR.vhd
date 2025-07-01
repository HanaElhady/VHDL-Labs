library ieee;
use ieee.numeric_std.all;

entity comparator is   
    port(
        X : in signed(1 downto 0);  -- 2-bit signed input X
        Y : in signed(1 downto 0);  -- 2-bit signed input Y
        output : out signed(1 downto 0)  -- 2-bit signed output
    );
end entity;

architecture rtl of comparator is
    signal result : signed(1 downto 0);  -- Temporary signal to hold subtraction result
begin
    -- Perform the subtraction and assign to 'result'
    result <= X - Y;
    
    -- Report based on the comparison of result
    process(result)
    begin
        if result > "00" then  -- If result is positive, X is larger
            report "X is larger than Y";
        elsif result < "00" then  -- If result is negative, Y is larger
            report "Y is larger than X";
        else  -- If result is zero, both are equal
            report "They are equal";
        end if;
    end process;
    
    -- Optionally assign the result to the output
    output <= result;
    
end architecture;
