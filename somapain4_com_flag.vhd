----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:46 03/26/2019 
-- Design Name: 
-- Module Name:    somapain4 - Behavioral 
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

entity somapain4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC_VECTOR (3 downto 0);
           Flag_Zero : out STD_LOGIC;
           Flag_Sinal : out STD_LOGIC;
           Flag_Overflow : out STD_LOGIC;
			  Flag_Cout : out STD_LOGIC);
end somapain4;


architecture Behavioral of somapain4 is

COMPONENT somapain
    PORT(
         cin : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         cout : OUT  std_logic;
         saida : OUT  std_logic
        );
end COMPONENT somapain;

signal prop: std_logic_vector(2 downto 0);
signal valor : std_logic_vector(3 downto 0);
signal c3 : std_logic;
signal c2 : std_logic;
begin

a0: somapain port map (cin, x(0), y(0), prop(0), valor(0));
a1: somapain port map (prop(0), x(1), y(1), prop(1), valor(1));
a2: somapain port map (prop(1), x(2), y(2), c2, valor(2));
a3: somapain port map (c2, x(3), y(3), c3, valor(3));
Flag_Zero <= not(valor(0) or valor(1) or valor(2) or valor(3));
Flag_Sinal <= valor(3);
Flag_Overflow <= c3 xor c2;
Flag_Cout <= c3;
cout <= c3;
saida <= valor;
end Behavioral;

