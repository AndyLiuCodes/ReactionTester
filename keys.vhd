LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY keys IS
PORT(CLOCK_50:IN STD_LOGIC;
	  KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	  LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END keys;
ARCHITECTURE BEHAVIOUR OF keys IS
BEGIN
PROCESS(CLOCK_50)
BEGIN
	IF (RISING_EDGE(CLOCK_50))THEN
	LEDR<=KEY;
	END IF;
END PROCESS;

END BEHAVIOUR;