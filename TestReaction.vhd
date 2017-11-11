LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TestReaction IS
	PORT (SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0); --Representing push down button, AND Reset
			CLOCK_50: IN STD_LOGIC;
			LEDR: OUT STD_LOGIC_VECTOR(0 DOWNTO 0); --Representing the led
			HEX0, HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --Representing 2 of the 7 segment displays
END TestReaction;

ARCHITECTURE BEHAVIOUR OF TestReaction IS
signal Pushn,Reset,w,c9,LEDn: STD_LOGIC;
signal BCD0, BCD1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
----------------PART OF THE CODE RELATED TO LED CIRCUIT------------------------ 
BEGIN

Pushn <= SW(0);
w <= sw(1);
STEP: entity work.Prescale PORT MAP(CLOCK_50, c9);
PROCESS 
BEGIN
WAIT UNTIL c9'EVENT AND c9='1';

IF Pushn='0' THEN
LEDn <='1';
ELSE
LEDn <='0';

END IF;
END PROCESS;

LEDR(0) <= LEDn;

---------------PART OF THE CODE RELATED TO SEGMENT DISPLAYS-----------------------

COUNTER: entity work.BCDCount2 port map(w, LEDn, c9,BCD0,BCD1);  --REPRESENTING 2 DIGIT BCD COUNTER
SEGDECODER1: entity work.SegDecoder port map(BCD0,HEX0);
SEGDECODER2: entity work.SegDecoder port map(BCD1,HEX1);

END BEHAVIOUR;