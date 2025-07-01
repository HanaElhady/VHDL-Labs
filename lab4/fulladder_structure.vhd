library ieee;
use ieee.std_logic_1164.all;

entity complex_gate is
    port(
        A, B, Cin : in std_logic;
        Cout, Sum : out std_logic
    );
end entity;

architecture sims of complex_gate is
    SIGNAL C_INTERNAL : std_logic;
    SIGNAL C2_INTERNAL : std_logic;
    SIGNAL C3_INTERNAL : std_logic;
begin
    -- XOR Gate 1
    g1: entity work.xor_gate
        port map(A => C_INTERNAL, B => Cin, C => C_INTERNAL);  -- Fix input/output mapping

    -- XOR Gate 2
    g2: entity work.xor_gate
        port map(A => A, B => B, C => Sum);  -- Fix input/output mapping

    -- AND Gate 1
    g3: entity work.and_gate
        port map(A => A, B => B, C => C2_INTERNAL);  -- Fix input/output mapping

    -- AND Gate 2
    g4: entity work.and_gate
        port map(A => C_INTERNAL, B => Cin, C => C3_INTERNAL);  -- Fix input/output mapping

    -- OR Gate
    g5: entity work.or_gate
        port map(A => C2_INTERNAL, B => C3_INTERNAL, C => Cout);  -- Fix input/output mapping

end architecture;
