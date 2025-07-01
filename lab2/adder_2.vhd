library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    port(
        w     : in  unsigned(3 downto 0);
        shift : in  std_logic;
        k     : out std_logic;
        y     : out unsigned(3 downto 0)
    );
end adder;

architecture sim of adder is
begin
    -- Process to handle the shifting
    process(w, shift)
    begin
        if shift = '1' then
            -- Perform the right shift operation on w using srl
            y <= w srl 1;  -- Shift right by 1 bit
            k <= w(0);     -- Set k to the LSB of w (before shifting)
        else
            y <= w;        -- No shift, just pass the value of w to y
            k <= '0';      -- Set k to 0 if no shift
        end if;
    end process;

end sim;
