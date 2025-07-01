library ieee;
use ieee.std_logic_1164.all;

entity circuit is	
    port (
        A, B, Cin : in std_logic;
        Cout, Sum : out std_logic
    );
end circuit;

architecture sims of circuit is	 
    signal C1, C2, C3 : std_logic;
begin		
    xor_gate_0 : entity work.xor_GATE
        port map (
            A => A,
            B => B,
            C => C1
        );		

    and_gate_0 : entity work.AND_GATE
        port map (
            A => A,
            B => B,
            C => C2
        );	

    xor_gate_1 : entity work.xor_GATE
        port map (
            A => C1,
            B => Cin,
            C => Sum
        );

    and_gate_1 : entity work.AND_GATE
        port map (
            A => C1,
            B => Cin,
            C => C3
        );	 
		
    or_gate_0 : entity work.OR_GATE
        port map (
            A => C2,
            B => C3,
            C => Cout
        );
end sims;
