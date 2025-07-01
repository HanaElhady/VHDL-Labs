library ieee;
use ieee.std_logic_1164.all;

entity trafficLight is 
	generic (clkFrequency: integer);  -- in Hz
    port (
        clk, rst : in std_logic;
        redNorth, yellowNorth, greenNorth : out std_logic;
        redWest, yellowWest, greenWest : out std_logic
    );
end entity;

architecture sims of trafficLight is	
    type states is (startNorth, north, stopNorth, northNext, stopWest, west, startWest, westNext); 
    signal currentState, nextState : states; 
	signal counter: integer range 0 to clkFrequency * 5 := 0;
begin 

    -- State transition process
    statesProcess : process(clk, rst)
    begin 
        if rst = '1' then
            currentState <= northNext; 
			current <= '0';
        elsif rising_edge(clk) then
            currentState <= nextState;
			if cur_state /= nxt_state then
                
				counter <= 0;
            
			else
                
				counter <= counter + 1;
            
			end if;
        end if;
    end process;

    -- Next state logic
    nextProcess : process(currentState)
    begin
		nextState <= currentState;
        case currentState is
            when startNorth => nextState <= north;   
            when north      => nextState <= stopNorth;
            when stopNorth  => nextState <= westNext;
            when westNext   => nextState <= startWest;
            when startWest  => nextState <= west;
            when west       => nextState <= stopWest;
            when stopWest   => nextState <= northNext;
            when northNext  => nextState <= startNorth; 
        end case;
    end process;			   

    -- Output control process
    outputProcess : process(currentState)
    begin
        -- Default values (all red)
        redNorth <= '1';
        yellowNorth <= '0';
        greenNorth <= '0';
        redWest <= '1';
        yellowWest <= '0';
        greenWest <= '0';

        case currentState is  
            when startNorth =>
                yellowNorth <= '1';

            when north =>
                redNorth <= '0';
                greenNorth <= '1';

            when stopNorth =>
                redNorth <= '0';
                yellowNorth <= '1';

            when westNext =>
                yellowNorth <= '1';

            when startWest =>
                yellowWest <= '1';

            when west =>
                redWest <= '0';
                greenWest <= '1';

            when stopWest =>
                redWest <= '0';
                yellowWest <= '1';

            when northNext =>
                yellowNorth <= '1';

        end case;
    end process;

end architecture;

