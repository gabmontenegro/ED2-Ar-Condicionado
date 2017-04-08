LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ar_condicionado_split IS
	PORT (	in1, in2, in3, in4, in5 : IN STD_LOGIC;
				out1, out2, out3 : OUT STD_LOGIC);
				
END ar_condicionado_split;


ARCHITECTURE BLOCO1 OF ar_condicionado_split IS
	SIGNAL MM0: INTEGER RANGE 9 TO 0 := 0; --PRIMEIRO CARACTERE DOS MINUTOS
	SIGNAL MM1: INTEGER RANGE 9 TO 0 := 9; --SEGUNDO CARACTERE DOS MINUTOS

COMPONENT On_Off IS
	PORT (	bt : in STD_LOGIC;
				led_online : out STD_LOGIC);
END COMPONENT;

COMPONENT Mux IS
	PORT (	sel_M : IN STD_LOGIC;
				min_T : IN STD_LOGIC_VECTOR (90 downto 0));
END COMPONENT;

COMPONENT DivFreq IS
	PORT (	fin : IN BIT; 
				fout: OUT BIT);
END COMPONENT;

COMPONENT Temporizador IS
	PORT (	en_T, sleep_T, dec1_T, rst_T, wr_T, clock	: IN STD_LOGIC;
				min_T :	OUT STD_LOGIC_VECTOR (90 DOWNTO 0);
				sel_M : OUT STD_LOGIC;
				led_TmrOn_T : OUT STD_LOGIC);
END COMPONENT;


BEGIN
END BLOCO1;