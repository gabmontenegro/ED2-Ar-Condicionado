LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ContAnel IS
	PORT (	trig 		:IN STD_LOGIC;
				set		:IN STD_LOGIC;
				saida		:OUT INTEGER RANGE 0 TO 9);
END ContAnel;

ARCHITECTURE contagem OF ContAnel IS 
TYPE tipo_estado is (E0, E1, E2, E3, E4 ,E5, E6, E7, E8, E9, E10,E11, E12, E13, E14, E15, E16, E17, E18);

SIGNAL estado_atual, proximo_estado: tipo_estado;

BEGIN
	PROCESS(trig, set) 
		BEGIN
			IF set = '1' THEN
				estado_atual <= E0;
				IF trig = '1' THEN
					estado_atual <= proximo_estado;
				END IF;
			END IF;
	END PROCESS;

	PROCESS (estado_atual, set)
		BEGIN
			IF set = '1' THEN
				CASE estado_atual IS
					WHEN E0 => proximo_estado <= E1;
					WHEN E1 => proximo_estado <= E2;
					WHEN E2 => proximo_estado <= E3;	
					WHEN E3 => proximo_estado <= E4;	
					WHEN E4 => proximo_estado <= E5;	
					WHEN E5 => proximo_estado <= E6;	
					WHEN E6 => proximo_estado <= E7;	
					WHEN E7 => proximo_estado <= E8;	
					WHEN E8 => proximo_estado <= E9;	
					WHEN E9 => proximo_estado <= E10;	
					WHEN E10 => proximo_estado <= E11;	
					WHEN E11 => proximo_estado <= E12;	
					WHEN E12 => proximo_estado <= E13;	
					WHEN E13 => proximo_estado <= E14;
					WHEN E14 => proximo_estado <= E15;
					WHEN E15 => proximo_estado <= E16;
					WHEN E16 => proximo_estado <= E17;
					WHEN E17 => proximo_estado <= E0;
				END CASE;
			END IF;
	END PROCESS;

	PROCESS (estado_atual)
		BEGIN
			CASE estado_atual IS
				WHEN E0 => saida <= 0;
				WHEN E1 => saida <= 1;
				WHEN E2 => saida <= 2;	
				WHEN E3 => saida <= 3;	
				WHEN E4 => saida <= 4;	
				WHEN E5 => saida <= 5;	
				WHEN E6 => saida <= 6;	
				WHEN E7 => saida <= 7;	
				WHEN E8 => saida <= 8;	
				WHEN E9 => saida <= 9;	
				WHEN E10 => saida <= 8;	
				WHEN E11 => saida <= 7;	
				WHEN E12 => saida <= 6;	
				WHEN E13 => saida <= 5;
				WHEN E14 => saida <= 4;
				WHEN E15 => saida <= 3;
				WHEN E16 => saida <= 2;
				WHEN E17 => saida <= 1;
			END CASE;
	END PROCESS;					
END contagem;