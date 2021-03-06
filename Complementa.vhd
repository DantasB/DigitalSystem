----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:58 04/02/2019 
-- Design Name: 
-- Module Name:    Complementa - Behavioral 
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

entity Complementa is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
end Complementa;

architecture Behavioral of Complementa is

COMPONENT somapain4
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           saida : out  STD_LOGIC_VECTOR (3 downto 0));
    
end COMPONENT;

SIGNAL inverso: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL resultado: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL um: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL complementado: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL cout: std_logic;

begin


inverso <= NOT(X);

um(0) <= '1';
um(1) <= '0';
um(2) <= '0';
um(3) <= '0';
label2: somapain4 port map (inverso, um, '0', cout, complementado);
saida <= complementado;


end Behavioral;
