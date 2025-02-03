
--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TestDisarm is
Port (
    KEY : in std_logic_vector(0 downto 0);   
    SW : in std_logic_vector(2 downto 1);   
    HEX5 : out std_logic_vector(6 downto 0);   
    HEX4 : out std_logic_vector(6 downto 0);   
    HEX3 : out std_logic_vector(6 downto 0);   
    LEDR : out std_logic_vector(0 downto 0)   
);
end TestDisarm;

architecture Behavioral of TestDisarm is

    component DisarmSystem
    Port (
        clock : in std_logic;   
        w : in std_logic_vector(1 downto 0);   
        Seg2 : out std_logic_vector(6 downto 0);  
        Seg1 : out std_logic_vector(6 downto 0);  
        Seg0 : out std_logic_vector(6 downto 0);   
        disarm : out std_logic   
    );
    end component;

  
begin

     
    uut: DisarmSystem
    Port Map (
        clock => KEY(0),
        w => SW,
        Seg2 => HEX5,
        Seg1 => HEX4,
        Seg0 => HEX3,
        disarm => LEDR(0)
    );
 

end Behavioral;


