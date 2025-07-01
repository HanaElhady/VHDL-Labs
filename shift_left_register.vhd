library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register is
    port (
        Q     : out std_logic_vector(3 downto 0);
        Clk   : in std_logic;
        input : in std_logic;
        RS    : in std_logic
    );
end shift_register;

architecture sims of shift_register is
    signal q_internal : std_logic_vector(3 downto 0);
begin
    process (Clk, RS)
    begin
        if RS = '1' then
            q_internal <= (others => '0');
        elsif rising_edge(Clk) then
            q_internal <= q_internal(2 downto 0) & input;
        end if;
    end process;

    Q <= q_internal;  -- Drive output port
end sims;
