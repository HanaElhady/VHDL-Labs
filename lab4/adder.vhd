library ieee;
use ieee.std_logic_1164.all;

-- 4-bit Adder Entity
entity adder is	
    generic(
        n: integer := 4  -- Generic parameter for the bit-width
    );
    port(
        A    : in std_logic_vector(n-1 downto 0);    -- n-bit input A
        B    : in std_logic_vector(n-1 downto 0);    -- n-bit input B
        cin  : in std_logic;                         -- Carry-in for the least significant bit
        sum  : out std_logic_vector(n-1 downto 0);   -- n-bit sum output
        cout : out std_logic                          -- Final carry-out (most significant carry)
    );
end entity;

architecture sims of adder is
    -- Declare intermediate carry-out signals for each adder stage
    signal cout_int : std_logic_vector(n-1 downto 1);  -- Carry-out intermediate signals
begin
    -- First Full Adder (for the least significant bit)
    first_adder : entity work.Fulladder
        port map(
            A    => A(0),        -- Least significant bit of A
            B    => B(0),        -- Least significant bit of B
            Cin  => cin,         -- Carry-in for the first Full Adder
            sum  => sum(0),      -- Sum for the least significant bit
            cout => cout_int(1)  -- Carry-out to the next adder
        );
    
    -- Generate block for adders 1 to n-2 (bits 1 to n-2)
    g : for i in 1 to n-2 generate
        adders : entity work.Fulladder
        port map(
            A    => A(i),         -- A(i) is the ith bit of A
            B    => B(i),         -- B(i) is the ith bit of B
            Cin  => cout_int(i),  -- Carry-in from the previous adder stage
            sum  => sum(i),       -- Sum for bit i
            cout => cout_int(i+1) -- Carry-out to the next adder stage
        );
    end generate;
    
    -- Last Full Adder (for the most significant bit)
    fourth_adder : entity work.Fulladder
        port map(
            A    => A(n-1),        -- Most significant bit of A
            B    => B(n-1),        -- Most significant bit of B
            Cin  => cout_int(n-1), -- Carry-in from the third adder
            sum  => sum(n-1),      -- Sum for the most significant bit
            cout => cout           -- Final carry-out
        );

end architecture;
