library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MULTIPLEXER is
    port ( 
        A, B : in  std_logic_VECTOR(7 DOWNTO 0);
        SEL  : in  std_logic_VECTOR(2 DOWNTO 0);
        C    : out std_logic_VECTOR(7 DOWNTO 0)
    );
end entity;

architecture SIMS of MULTIPLEXER is
begin	   
	FOR I IN  A'RIGHT TO A'LEFT LOOP 
		GEN : ENTITY WORK.MULTIPLEXER
			PORT MAP (
			A => A(i),
			B => B(i),
			SEL => SEL,
			C = > C(i)
			);
	END LOOP;
	
    process(A, B, SEL)  -- Include SEL in sensitivity list
    begin
        if (SEL = '0') then
            C <= A;
        else
            C <= B;
        end if;
    end process;
end architecture;
