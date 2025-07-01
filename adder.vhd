library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
    port(
        A ,B , Cin : in std_logic;
        Cout,SUM : out std_logic
    );
end fullAdder;

architecture sims of fullAdder is
begin
SUM  <= A xor B xor Cin;
COUT <= (A and B) or (A and Cin) or (B and Cin);

end sims;
