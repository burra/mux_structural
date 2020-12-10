library ieee;
use ieee.std_logic_1164.all;
library work;
use work.mux21;

entity mux_structural is
port (a, b, c, d: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		F: out std_logic
		);
end entity mux_structural;


architecture structural of mux_structural is

signal wire0, wire1: std_logic;

begin

mux0: entity work.mux21 port map (a=>a, b=>b, sel=>sel(0), F=>wire0);
mux1: entity work.mux21 port map (a=>c, b=>d, sel=>sel(0), F=>wire1);
mux2: entity work.mux21 port map (a=>wire0, b=>wire1, sel=>sel(1), F=>F);
			
	
end architecture structural;