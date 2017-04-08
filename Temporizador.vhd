LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.numeric_std;

ENTITY Temporizador IS
	PORT (	clock, enable, reset, set, setm1	:IN STD_LOGIC;
				disp0, disp1							:OUT STD_LOGIC_VECTOR (6 downto 0);
				fim										:OUT STD_LOGIC := '0');
END Temporizador;


ARCHITECTURE Temporizador_arc OF Temporizador IS 
CONSTANT segundo : INTEGER := 99999;  -- definindo 1 segundo
SIGNAL parado: STD_LOGIC := '0';
SIGNAL clock2: STD_LOGIC;

BEGIN
		
	PROCESS(clock, enable, reset) 
		VARIABLE cont: INTEGER RANGE 0 TO segundo;
		VARIABLE s0: INTEGER := 0;
		VARIABLE m0: INTEGER RANGE 9 TO 0 := 0;
		VARIABLE m1: INTEGER RANGE 9 TO 0 := 9;
	BEGIN
		IF reset = '1' THEN
			m1 := 0;
			m0 := 0;
			clock2 <= parado;
				IF set = '1' THEN
					m0 := 0;
					--m1 := setm1;
					IF setm1 = '0' THEN m1 := 1;ELSE m1:= 0;
					END IF;
					
						IF enable = '1' AND reset = '0' THEN
							clock2 <= clock;	
								IF rising_edge(clock2) THEN 		   
									IF(cont /= segundo) THEN 			
										cont := cont + 1;				                    
									ELSE 										
										cont := 0;
										s0 := s0 + 1;
										IF(s0 = 59) THEN
											m0 := m0 - 1;
											s0 := 0;
												IF (m0 = 0) THEN
													m1 := m1 - 1;
													m0 := 0;
														IF (m1 = 0 and m0 = 0) THEN
															fim <= '1';
															clock2 <= parado;
														END IF;
												END IF;
										END IF;
									END IF;
								END IF;
						END IF;
				END IF;
		END IF;
	END PROCESS; 
END Temporizador_arc;