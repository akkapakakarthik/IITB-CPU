library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Left_Shifter is
	port (input : in std_logic_vector (15 downto 0);
			output : out std_logic_vector (15 downto 0));
end entity Left_Shifter;

architecture Struct of Left_Shifter is
begin
	output(15 downto 8) <= input(7 downto 0);
	output(7 downto 0) <= "00000000";
end Struct;