library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_TB is
end shift_register_TB;

architecture sims of shift_register_TB is
    constant n : integer := 4;
    signal shift, CLK, w : std_logic := '0';
    signal Y : std_logic_vector(n-1 downto 0) := "1001";

    component shift_register_loop
        generic (
            n : integer := 4
        );
        port (
            shift : in std_logic;
            clk   : in std_logic;
            w     : in std_logic;
            y     : inout std_logic_vector(n-1 downto 0)
        );
    end component;
begin
    uut: shift_register_loop
        generic map (n => n)
        port map (
            shift => shift,
            clk   => CLK,
            w     => w,
            y     => Y
        );

    -- Clock generation
    clk_process : process
    begin
        while now < 100 ns loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        wait for 10 ns;

        w <= '1';
        shift <= '1';
        wait for 10 ns;  -- shift 1: Y = 1100

        w <= '0';
        wait for 10 ns;  -- shift 2: Y = 0110

        shift <= '0';     -- disable shifting
        wait for 10 ns;   -- no change

        shift <= '1';
        w <= '1';
        wait for 10 ns;   -- shift 3: Y = 1011

        wait;
    end process;
end sims;
