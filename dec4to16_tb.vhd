library ieee;
use ieee.std_logic_1164.all;

entity dec4to16_tb is
end;

architecture sims of dec4to16_tb is  
    signal binary_input   : std_logic_vector(3 downto 0);	
    signal en             : std_logic;
    signal decimal_output : std_logic_vector(15 downto 0);
begin

    -- DUT instance
    dec4to16_inst : entity work.dec4to16   
        port map(
            binary_input   => binary_input,
            en             => en,
            decimal_output => decimal_output
        );  

    -- Test process
    process
    begin 
        en <= '1';
        wait for 10 ns;

        -- Test 0000 -> expect "0000_0000_0000_0001"
        binary_input <= "0000";
        wait for 10 ns;
        assert (decimal_output = x"0001")
            report "Test failed for input 0000"
            severity error;

        -- Test 0001 -> expect "0000_0000_0000_0010"
        binary_input <= "0001";
        wait for 10 ns;
        assert (decimal_output = x"0002")
            report "Test failed for input 0001"
            severity error;	

        wait;
    end process;

end architecture;
