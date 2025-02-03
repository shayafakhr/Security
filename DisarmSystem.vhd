--jasanveer dhaliwal 301591361, Shaya Fakhrabadi 301590507, faris Ali 301583599


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DisarmSystem is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        w : in std_logic_vector(1 downto 0);
        Seg2 : out std_logic_vector(6 downto 0);
        Seg1 : out std_logic_vector(6 downto 0);
        Seg0 : out std_logic_vector(6 downto 0);
        disarm : out std_logic  
    );
end DisarmSystem;

architecture Behavioral of DisarmSystem is
 
    type state_type is (A, B, C, D);
    signal current_state, next_state : state_type;

 
    constant BLANK : std_logic_vector(6 downto 0) := "1111111"; 
    constant NUM_3 : std_logic_vector(6 downto 0) := "0110000"; 
    constant NUM_1 : std_logic_vector(6 downto 0) := "1111001"; 
    constant NUM_2 : std_logic_vector(6 downto 0) := "0100100"; 
begin


    process(clock, reset)
    begin
        if reset = '1' then
            current_state <= A;
        elsif rising_edge(clock) then
            current_state <= next_state;
        end if;
    end process;


    process(current_state, w)
    begin
  
        next_state <= current_state;
        Seg2 <= BLANK;
        Seg1 <= BLANK;
        Seg0 <= BLANK;
        disarm <= '0';  

        case current_state is
            when A =>
                if w = "00" then
                    next_state <= A;
                elsif w = "11" then
                    next_state <= B;
                end if;

            when B =>
                Seg2 <= NUM_3;
                if w = "01" then
                    next_state <= C;
                elsif w = "00" or w = "11" or w = "10" then
                    next_state <= A;
                end if;

            when C =>
                Seg2 <= NUM_3; 
                Seg1 <= NUM_1; 
                if w = "10" then
                    next_state <= D; 
                elsif w = "00" or w = "11" or w = "01" then
                    next_state <= A;
                end if;

            when D =>
                Seg2 <= NUM_3;
                Seg1 <= NUM_1; 
                Seg0 <= NUM_2;  
                disarm <= '1';  
                next_state <= A; 
        end case;
    end process;

end Behavioral;
