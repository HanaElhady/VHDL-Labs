library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MULTIPLEXER is
    port ( 
        A, B : in  std_logic;
        SEL  : in  std_logic;
        C    : out std_logic
    );
end entity;

architecture SIMS of MULTIPLEXER is
begin
    process(A, B, SEL)  -- Include SEL in sensitivity list
    begin
        if (SEL = '0') then
            C <= A;
        else
            C <= B;
        end if;
    end process;
end architecture;
