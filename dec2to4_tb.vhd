library ieee;
use ieee.std_logic_1164.all;

entity dec2to4_tb is
end dec2to4_tb;

architecture sims of dec2to4_tb is 
    signal binary_input   : std_logic_vector(1 downto 0);
    signal en             : std_logic;
    signal decimal_output : std_logic_vector(3 downto 0);
begin  
    -- Instantiate the decoder module
    DUT: entity work.dec2to4
        port map( 
            binary_input   => binary_input,
            en             => en,
            decimal_output => decimal_output
        );			

    -- Stimulus process
    stim_proc: process
    begin
        -- Wait 10 ns before enabling the decoder
        en <= '0';
        binary_input <= "00";
        wait for 10 ns;

        en <= '1';

        -- Test 00
        binary_input <= "00"; 
        wait for 5 ns;		 
        assert (decimal_output = "0001")
            report "Failed for input 00" severity error;

        -- Test 01
        binary_input <= "01"; 
        wait for 5 ns;		 
        assert (decimal_output = "0010")
            report "Failed for input 01" severity error;

        -- Test 10
        binary_input <= "10"; 
        wait for 5 ns;		 
        assert (decimal_output = "0100")
            report "Failed for input 10" severity error;

        -- Test 11
        binary_input <= "11"; 
        wait for 5 ns;		 
        assert (decimal_output = "1000")
            report "Failed for input 11" severity error;

        -- If all assertions passed
        report "All decoder outputs are correct." severity note;

        wait;
    end process;
end sims;

