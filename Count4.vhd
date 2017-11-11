LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Count4 IS
	PORT (Load,Enable,Clock: IN STD_LOGIC;
			D: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Q_OUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END Count4;

ARCHITECTURE BEHAVIOUR OF Count4 IS

SIGNAL X, M, Q: STD_LOGIC_VECTOR(3 DOWNTO 0); --X = output from XOR gates, M = output from MUX gates
SIGNAL A: STD_LOGIC_VECTOR(4 DOWNTO 0);  -- A = output of AND gates

BEGIN
A(0)<= Enable;
PROCESS (Clock)
BEGIN
Counter: FOR I IN 0 TO 3 Loop 
X<= A(3 DOWNTO 0) XOR Q;
IF (Load='0') Then
	M<= X; -- or WHEN Load='0' 
ELSE 
	M<=D;
END IF;

IF rising_edge(Clock) THEN
Q<= M ; --or WHEN rising_edge(Clock);

END IF;
A(4 Downto 1)<= A(3 downto 0) AND Q;

END Loop;
Q_OUT<= Q;

END PROCESS;
END BEHAVIOUR;
