library ieee;
use ieee.std_logic_1164.all;

entity dec4to16 is
    port(  
        w  : in  std_logic_vector(3 downto 0);
        y  : out std_logic_vector(15 downto 0);
        en : in  std_logic
    );
end entity;

architecture sims of dec4to16 is
    signal y_internal : std_logic_vector(3 downto 0);  
begin

    dec_high: entity work.dec2to4
        port map(
            w  => w(3 downto 2),
            y  => y_internal,
            en => en
        );

    g1: for i in 0 to 3 generate
        dec_low: entity work.dec2to4
            port map(
                w  => w(1 downto 0),
                y  => y(4*(i+1)-1 downto 4*i),
                en => y_internal(i)
            );
    end generate;

end architecture;
