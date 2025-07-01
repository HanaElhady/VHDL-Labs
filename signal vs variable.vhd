architecture sims of FF is	 
signal temp : std_logic;

begin		
	
	process(clk)
	begin
		if reset = '1' then 
			out <= '0';
		elsif rising_edge(clk) then
			temp <= a or b;
			out <= temp;
		end process;
		
end sims;


architecture sims of FF is	 
signal temp : std_logic;

begin		
	
	process(clk) 
	variable temp :std_logic;
	begin					 
		temp ='0';
		if reset = '1' then 
			out <= '0';
		elsif rising_edge(clk) then
			temp := a or b;
			out <= temp;
		end process;
		
end sims;




architecture Ex_arch of Ex is	 
signal B : bit;

begin		
	B <= A;
	F <= not B;
		
end architecture; 



architecture Ex_arch of Ex is	 
signal B : bit;

begin
	Proc_Ex : process (A)
	begin
	B <= A;
	F <= not B;
	end process;
end architecture;


architecture Ex_arch of Ex is	 
signal B : bit;

begin
	Proc_Ex : process (A) 
	variable temp : bit := '0';
	begin
		temp := A ;
	B <= temp;
	F <= not temp;
	end process;
end architecture;
