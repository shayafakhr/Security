--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BlinkSystem is
Port (
    clock : in STD_LOGIC; 
    Enable : in STD_LOGIC; 
    Seg0 : out STD_LOGIC_VECTOR(6 downto 0); 
    Seg1 : out STD_LOGIC_VECTOR(6 downto 0); 
    Seg2 : out STD_LOGIC_VECTOR(6 downto 0); 
    red : out STD_LOGIC_vector (9 downto 0)
);
end BlinkSystem;

architecture Behavioral of BlinkSystem is
component PreScale is
port (
	InClock : in STD_LOGIC; 
	OutClock : out STD_LOGIC 
);
end component;
signal Clock_Slow : STD_LOGIC; 

begin
PreScale_component: PreScale port map (InClock => clock, outClock => Clock_Slow);

process (Clock_Slow, Enable)
begin
if (Enable = '1') then
	if (clock_Slow = '1') then
		Seg0 <= "0010010";
		Seg1 <= "1000000";
		Seg2 <= "0010010";
		red <= "1111111111";
	else
		Seg0 <= "1111111";
		Seg1 <= "1111111";
		Seg2 <= "1111111";
		red <= "0000000000";
	end if;

else
	Seg0 <= "1111111";
	Seg1 <= "1111111";
	Seg2 <= "1111111";
	red <= "0000000000";

end if;
end process;
 


end Behavioral;
