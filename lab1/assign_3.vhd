library ieee;
use ieee.std_logic_1164.all;

entity assign_3 is 
	port(
	x,y,cin : in std_logic;
	sum,cout : out std_logic
	);									 
end assign_3 ;

architecture sim of assign_3 is
begin
	sum  <= x XOR y XOR cin;
	cout <= (x And y) OR (x AND cin) OR (cin AND y);
end sim;



