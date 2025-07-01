library ieee;
use ieee.std_logic_1164.all;

-- Full Adder entity for a single bit
entity Fulladder is
    port(
        A    : in std_logic;    -- First input bit
        B    : in std_logic;    -- Second input bit
        Cin  : in std_logic;    -- Carry-in for the bit
        sum  : out std_logic;   -- Sum of the bits
        cout : out std_logic    -- Carry-out for the next bit
    );
end entity;

architecture sims of Fulladder is
begin
    sum <= A XOR B XOR Cin;  -- Sum is the XOR of all three inputs (A, B, Cin)
    cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);  -- Carry-out logic
end architecture;