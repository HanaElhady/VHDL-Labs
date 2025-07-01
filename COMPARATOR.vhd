library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_buffer is
    port (
        A_in  : in  std_logic_vector(5 downto 0);
        OE1   : in  std_logic;                    
        OE2   : in  std_logic;                   
        Y_out : out std_logic_vector(5 downto 0)  
    );
end entity;

architecture structural of hex_buffer is

    signal Y_full  : std_logic_vector(7 downto 0);

    -- Component declaration
    component ls241
        port (
            A   : in  std_logic_vector(7 downto 0);
            OE1 : in  std_logic;
            OE2 : in  std_logic;
            Y   : out std_logic_vector(7 downto 0)
        );
    end component;

begin
     ls241_inst : ls241
        port map (
            A   => "00" & A_in(5 downto 0 ),
            OE1 => OE1,
            OE2 => OE2,
            Y   => Y_full
        );

    Y_out <= Y_full(5 downto 0);

end architecture;

