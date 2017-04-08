LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY DivFreq IS
	PORT (	CLOCK_50:	IN STD_LOGIC;
				enable:		IN	STD_LOGIC;
				clock100k: 	OUT STD_LOGIC);
END DivFreq;

ARCHITECTURE Divisor100k of DivFreq is

BEGIN
	PROCESS(CLOCK_50, enable) 
		VARIABLE cont : NATURAL range 0 to 500 := 0;
	BEGIN
		IF rising_edge(CLOCK_50) THEN 		
			IF cont=499 THEN cont := 0;                        
			ELSE cont := cont + 1; 										
			END IF;
			IF cont <= 249 THEN clock100k <= '1';
			ELSE clock100k <= '0'; END IF;
		END IF;
	END PROCESS;
END Divisor100k;