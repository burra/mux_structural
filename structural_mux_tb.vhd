library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;


entity mux_structural_tb is
end entity mux_structural_tb;

architecture logic of mux_structural_tb is

signal a, b, c, d, F: std_logic:='0';
signal sel: std_logic_vector(1 downto 0) := "00";
signal sel_reg: unsigned(1 downto 0) := "00";

Constant P0: time := 2 ms;
Constant P1: time := 4 ms;
Constant P2: time := 8 ms;
Constant P3: time := 16 ms;

Constant sel_period: time := 50 ms;

begin

-- generate 4 different clocks at 4 different speeds
process	begin
a<='0';
wait for P0/2;
a<='1';
wait for P0/2;
end process;

process	begin
b<='0';
wait for P1/2;
b<='1';
wait for P1/2;
end process;

process	begin
c<='0';
wait for P2/2;
c<='1';
wait for P2/2;
end process;

process	begin
d<='0';
wait for P3/2;
d<='1';
wait for P3/2;
end process;


-- make an instance of DUT and connect it's ports
DUT: entity work.mux_structural port map 
(a=>a, b=>b, c=>c, d=>d, sel=>sel, F=>F);

-- process will automatically re-execute without any delay-- in synthesis, it needs a sensitivity list.
process
begin
sel_reg<="00";
while (TRUE) loop
wait for sel_period;
sel_reg <= sel_reg + 1;	
end loop;
end process;

sel<=std_logic_vector(sel_reg);
	
end architecture logic;












