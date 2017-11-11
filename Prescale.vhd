LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Prescale IS
	PORT (Clk_in: IN STD_LOGIC;
			Clk_out: OUT STD_LOGIC);
END Prescale;

ARCHITECTURE BEHAVIOUR OF Prescale IS

SIGNAL Count: UNSIGNED(19 DOWNTO 0);

BEGIN
	PROCESS(Clk_in)
	
	BEGIN 
	
		IF rising_edge(Clk_in) THEN
			Count <= Count + 1;  --- or "00000000000000000001";
		ELSE 
			Count <= Count;
		END IF;
	END PROCESS;
	
	Clk_out <= Count(19);

END BEHAVIOUR;