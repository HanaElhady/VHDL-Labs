library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- for integer conversion

entity ripple_tb is
end ripple_tb;

architecture sims of ripple_tb is
    signal A, B, SUM : std_logic_vector(3 downto 0);
    signal Cin, Cout : std_logic;
begin
    -- Instantiate your 4-bit ripple-carry adder (DUT)
    DUT: entity work.ripple
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Cout => Cout,
            SUM  => SUM
        );

    -- Test process for all combinations
    process
        variable a_int, b_int, cin_int, total, sum_int, cout_int : integer;
    begin
        for a_int in 0 to 15 loop
            for b_int in 0 to 15 loop
                for cin_int in 0 to 1 loop
                    -- Apply inputs
                    A   <= std_logic_vector(to_unsigned(a_int, 4));
                    B   <= std_logic_vector(to_unsigned(b_int, 4));
                    Cin <= std_logic'val(cin_int);
                    wait for 10 ns;

                    -- Expected result
                    total := a_int + b_int + cin_int;
                    sum_int := total mod 16;
                    cout_int := total / 16;

                    assert (unsigned(SUM) = to_unsigned(sum_int, 4) and Cout = std_logic'val(cout_int))
                        report "Test failed for A=" & integer'image(a_int) &
                               ", B=" & integer'image(b_int) &
                               ", Cin=" & integer'image(cin_int) &
                               " => Expected SUM=" & integer'image(sum_int) &
                               ", Cout=" & integer'image(cout_int) &
                               " but got SUM=" & integer'image(to_integer(unsigned(SUM))) &
                               ", Cout=" & std_logic'image(Cout)
                        severity error;
                end loop;
            end loop;
        end loop;

        report "All tests passed successfully." severity note;
        wait;
    end process;

end sims;
