

--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TestBlinkSystem is
    Port (
        CLOCK_50 : in STD_LOGIC; 
        SW : in STD_LOGIC_VECTOR(9 downto 0); 
        HEX5 : out STD_LOGIC_VECTOR(6 downto 0); 
        HEX4 : out STD_LOGIC_VECTOR(6 downto 0); 
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0); 
        LEDR : out STD_LOGIC_VECTOR(9 downto 0) 
    );
end TestBlinkSystem;

architecture Behavioral of TestBlinkSystem is
component BlinkSystem is
Port (
    clock : in STD_LOGIC; 
    Enable : in STD_LOGIC; 
    Seg0 : out STD_LOGIC_VECTOR(6 downto 0); 
    Seg1 : out STD_LOGIC_VECTOR(6 downto 0); 
    Seg2 : out STD_LOGIC_VECTOR(6 downto 0); 
    red : out STD_LOGIC_vector (9 downto 0)
);
end component;

begin
TestBlinkSystem: BlinkSystem port map (clock => CLOCK_50, Enable => SW(0), Seg0 => HEX3, Seg1 => HEX4, Seg2 => HEX5, red => LEDR);



end Behavioral;
