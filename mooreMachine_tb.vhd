library ieee;
use ieee.std_logic_1164.all;

entity mooreMachine_tb is
end mooreMachine_tb;

architecture rtl of mooreMachine_tb is
    signal rst, clk, w, z : std_logic := '0';
begin

    -- DUT Instance
    uut: entity work.mooreMachine
        port map (
            rst => rst,
            clk => clk,
            w   => w,
            z   => z
        );

    -- Clock generation (period: 10ns)
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        -- Test sequence
        w <= '1';        -- A -> B
        wait for 20 ns;

        w <= '1';        -- B -> C
        wait for 20 ns;

        w <= '0';        -- C -> A
        wait for 20 ns;

        -- End of test
        wait;
    end process;

end rtl;
