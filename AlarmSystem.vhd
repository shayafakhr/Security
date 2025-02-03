--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AlarmSystem is
    Port (
        CLOCK_50 : in std_logic;
        SW : in std_logic_vector(9 downto 0);  
        KEY : in std_logic_vector(0 downto 0);  
        LEDR : out std_logic_vector(9 downto 0);  
        HEX5 : out std_logic_vector(6 downto 0);
        HEX4 : out std_logic_vector(6 downto 0);
        HEX3 : out std_logic_vector(6 downto 0);
        HEX2 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        HEX0 : out std_logic_vector(6 downto 0)
    );
end AlarmSystem;

architecture Behavioral of AlarmSystem is

    signal DisarmSignal : std_logic := '0';  
    signal Trigger : std_logic := '0';        

    component BlinkSystem is
    Port (
        clock : in STD_LOGIC; 
        Enable : in STD_LOGIC; 
        Seg0 : out STD_LOGIC_VECTOR(6 downto 0); 
        Seg1 : out STD_LOGIC_VECTOR(6 downto 0); 
        Seg2 : out STD_LOGIC_VECTOR(6 downto 0); 
        red : out STD_LOGIC_VECTOR(9 downto 0) 
    );
    end component;

    component DisarmSystem is
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
     Disarm: DisarmSystem port map (
        clock => KEY(0),
        w => SW(2 downto 1),
        Disarm => DisarmSignal,
        Seg2 => HEX2,
        Seg1 => HEX1,
        Seg0 => HEX0
    );

     Blink: BlinkSystem port map (
        Clock => CLOCK_50,
        Enable => Trigger,  
        Seg0 => HEX3,
        Seg1 => HEX4,
        Seg2 => HEX5,
        red => LEDR
    );

 process(CLOCK_50, trigger, DisarmSignal, SW)
begin
	 if rising_edge(CLOCK_50) then
 		  if DisarmSignal = '1' then
            Trigger <= '0';   
        elsif SW(0) = '1' and (SW(9) = '1' or SW(8) = '1' or SW(7) = '1')  then
            Trigger <= '1';    
		  else
				Trigger <= Trigger;
	     end if;
    else
			Trigger <= Trigger;
	  
	  
		end if;
end process;

end Behavioral;
