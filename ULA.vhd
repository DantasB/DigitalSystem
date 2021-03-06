----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:07 04/16/2019 
-- Design Name: 
-- Module Name:    ULA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ULA is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Operacao : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end ULA;

architecture Behavioral of ULA is

COMPONENT somapain4
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT somapain4;
    
COMPONENT Complementa is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT Complementa;
    
COMPONENT Inversor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT Inversor;
    
COMPONENT subtratain4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           bin : in  STD_LOGIC;
           bout : out  STD_LOGIC;
			  saida : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end COMPONENT subtratain4;

COMPONENT Modulo_Xor is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT Modulo_Xor;    

COMPONENT Modulo_Or is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT Modulo_Or;
	
COMPONENT Modulo_And is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT Modulo_And;

COMPONENT incrementa1 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT incrementa1;

signal Not_A, Compl_A, A_mais_B, A_mais_1, A_menos_B, A_and_B, A_xor_B, A_or_B : STD_LOGIC_VECTOR (3 downto 0);

begin

	-- Declarando os componentes
	U0: Inversor port map (A, Not_A); -- Para operação 0
	U1: Complementa port map (A, Compl_A); -- Para operação 1
	U2: somapain4 port map (A, B, '0', A_mais_B); -- Para operaçã9o 2
	U3: incrementa1 port map (A, A_mais_1); -- Para operação 3
	U4: subtratain4 port map (A, B, '0', A_menos_B); -- Para operação 4
	U5: Modulo_And port map (A, B, A_and_B); -- Para operação 5
	U6: Modulo_Xor port map (A, B, A_xor_B); -- Para operação 6
	U7: Modulo_Or port map (A, B, A_or_B); -- Para operação 7
	
	process (Operacao, Not_A, Compl_A, A_mais_B, A_mais_1, A_menos_B, A_and_B, A_xor_B, A_or_B)
	begin
		case Operacao is
			when "0000" =>
				Z <= A_and_B;
			when "1000" =>
				Z <= A_and_B;
			when "0001" =>
				Z <= A_xor_B;
			when "1001" =>
				Z <= A_xor_B;
			when "0010" =>
				Z <= A_mais_1;
			when "1010" =>
				Z <= A_mais_1;
			when "0011" =>
				Z <= A_menos_B;
			when "1011" =>
				Z <= A_menos_B;
			when "0100" =>
				Z <= A_or_B;
			when "1100" =>
				Z <= A_or_B;
			when "0101" =>
				Z <= A_mais_B;
			when "1101" =>
				Z <= A_mais_B;
			when "0110" =>
				Z <= Compl_A;
			when "1110" =>
				Z <= Compl_A;
			when "0111" =>
				Z <= Not_A;
			when "1111" =>
				Z <= Not_A;
		end case;
	end process;

end Behavioral;
