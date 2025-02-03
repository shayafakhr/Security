--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity PreScale is
generic (
WIDTH : integer := 25 
);
port (
InClock : in STD_LOGIC; 
OutClock : out STD_LOGIC 
);
end PreScale;

architecture Behavioral of PreScale is
signal Clock_50 : STD_LOGIC;
signal counter : unsigned(WIDTH-1 downto 0) := (others => '0'); 
begin

Clock_50 <= InClock;


process(Clock_50)
begin
if rising_edge(Clock_50) then
counter <= counter + 1;
end if;
end process;


OutClock <= counter(WIDTH-1);
end Behavioral;