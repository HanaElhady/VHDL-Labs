library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port(
        input  : in std_logic_vector(3 downto 0);
        sel    : in std_logic_vector(1 downto 0);
        output : out std_logic
    );
end mux;

architecture sims of mux is
begin
   with sel select
   output <= input(0) when "00" ,
   input(1) when "01",
   input(2) when "10",
   input(3) when others;
end sims;
