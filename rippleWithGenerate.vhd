library ieee;
use ieee.std_logic_1164.all;

entity ripple is	
	generic (
	n : integer := 4
	);
    port(
	A ,B : in std_logic_vector( n-1 downto 0);	 
	Cin : in std_logic;
    Cout : out std_logic;
	SUM : out std_logic_vector( n-1 downto 0)
    
    );
end ripple;

architecture sims of ripple is	 
signal Cin_internal : std_logic_vector( n downto 0);

begin		
	
	Cin_internal(0) <= Cin;
	
	
	gen : for i in 0 to n-1 generate 	 
	
	half : entity work.halfAdder 
		
    port map(
	A => A(i),
	B => B(i),
	Cin => Cin_internal(i),
    Cout => Cin_internal(i+1),
	SUM => SUM (i)
    );	
	
	end generate;  	
	
	Cout <= cin_internal( n-1);
end sims;
