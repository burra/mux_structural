library ieee;
use ieee.std_logic_1164.all;

entity MUX21 is
	port (a, b, sel: in std_logic;
		F: out std_logic);
	end entity MUX21;

architecture behavioral of MUX21 is

begin

	F<=a when sel ='0' else b;	
	
end architecture behavioral;