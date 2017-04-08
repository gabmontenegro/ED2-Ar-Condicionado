LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FF_T IS
	PORT (	clock: in STD_LOGIC;
					T : in STD_LOGIC;
					Q : out STD_LOGIC);
END FF_T;

ARCHITECTURE FF_T_ARC OF FF_T IS 
SIGNAL tmp: STD_LOGIC;
BEGIN
	PROCESS (clock)
		BEGIN
			IF rising_edge(clock) THEN
				IF T = '0' THEN
					tmp <= tmp;
				ELSIF T='1' THEN
					tmp <= NOT (tmp);
				END IF;
			END IF;
	END PROCESS;
	Q <= tmp;
END FF_T_ARC;