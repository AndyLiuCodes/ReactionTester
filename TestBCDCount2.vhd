LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TestBCDCount2 IS
	PORT (SW: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			LEDR: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END TestBCDCount2;

ARCHITECTURE BEHAVIOUR OF TestBCDCount2 IS

BEGIN

step: ENTITY WORK.BCDCount2 PORT MAP(KEY(0),SW(0),KEY(1),LEDR(3 DOWNTO 0), LEDR(7 DOWNTO 4));


END BEHAVIOUR;