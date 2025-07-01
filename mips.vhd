library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity mips is	
	generic(
		addrWidth : integer := 5;
		regCount  : integer := 32;
		dataWidth : integer := 32 
	);
	port (
		regWrite   : in std_logic;
		clk, rst   : in std_logic;
		readRegA   : in std_logic_vector(addrWidth - 1 downto 0);
		readRegB   : in std_logic_vector(addrWidth - 1 downto 0);
		writeReg   : in std_logic_vector(addrWidth - 1 downto 0);
		writeData  : in std_logic_vector(dataWidth - 1 downto 0);
		readDataA  : out std_logic_vector(dataWidth - 1 downto 0);
		readDataB  : out std_logic_vector(dataWidth - 1 downto 0)
	);
end entity;

architecture sims of mips is   
	subtype width is std_logic_vector(dataWidth - 1 downto 0);
	type REGARRAY is array(0 to regCount - 1) of width; -- FIX: regCount not regCount+1
	signal regFile : REGARRAY;
begin	  
	-- Synchronous process for write/reset
	process(clk, rst)
	begin
		if rst = '1' then
			for i in 0 to regFile'length - 1 loop  -- FIX: range should be 0 to N-1
				regFile(i) <= (others => '0');
			end loop;
		elsif rising_edge(clk) then
			if regWrite = '1' then
				regFile(to_integer(unsigned(writeReg))) <= writeData;
			end if;
		end if;
	end process;

	-- Asynchronous reads
	readDataA <= regFile(to_integer(unsigned(readRegA)));
	readDataB <= regFile(to_integer(unsigned(readRegB)));

end architecture;
