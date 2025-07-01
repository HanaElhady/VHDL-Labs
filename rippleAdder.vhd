library ieee;
use ieee.std_logic_1164.all;

entity ripple is
    port(
	A ,B : in std_logic_vector(3 downto 0);	 
	Cin : in std_logic;
    Cout : out std_logic;
	SUM : out std_logic_vector(3 downto 0)
    
    );
end ripple;

architecture sims of ripple is	 
signal Cin_1 , Cin_2 , Cin_3 : std_logic;

begin		
	
	half_a : entity work.halfAdder
    port map(
	A => A(0),
	B => B(0),
	Cin => Cin,
    Cout => Cin_1,
	SUM => SUM (0)
    );	  
	
	half_b : entity work.halfAdder
    port map(
	A => A(1),
	B => B(1),
	Cin => Cin_1,
    Cout => Cin_2,
	SUM => SUM (1)
    );
	half_c : entity work.halfAdder
    port map(
	A => A(2),
	B => B(2),
	Cin => Cin_2,
    Cout => Cin_3,
	SUM => SUM (2)
    );
	half_d : entity work.halfAdder
    port map(
	A => A(3),
	B => B(3),
	Cin => Cin_3,
    Cout => Cout,
	SUM => SUM (3)
    );
end sims;
