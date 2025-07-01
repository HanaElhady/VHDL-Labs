library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is 
	generic(
	countRegister : integer := 32;
	addrWidth : integer := 5;
	dataWidth : integer := 32
	);
	port(
	regWrite , clk ,rst : in std_logic ;
	readAddressA , readAddressB , writeReg: in std_logic_vector( addrWidth-1 downto 0 );
	readDataA , readDataB : out std_logic_vector( dataWidth - 1 downto 0);	
	writeData : in std_logic_vector( dataWidth - 1 downto 0)
	
	);
end entity;	

architecture sims of registerFile is		
subtype arrayWidth is  std_logic_vector(dataWidth-1 downto 0 );
type regArray is Array( 0 to countRegister-1 ) of arrayWidth;
signal regFile : regArray;

begin 
	process(clk,rst) 
	begin
	if(rst = '1')
		then
		for i in 0 to countRegister-1 loop
			regFile(i) <= (others => '0');
		end loop;
	else
		if(regWrite = '1') then 
			regFile(to_integer(unsigned(writeReg))) <= writedata ;
		end if;
	end if;	  
	end process;
	readDataA <= regFile(to_integer(unsigned(readAddressA)));
	readDataB <= regFile(to_integer(unsigned(readAddressB)));
end architecture;

