library ieee;
use ieee.std_logic_1164.all;

entity T_flipflop is
    port(
        t: in std_logic;      -- Toggle input
        clk, clr: in std_logic;  -- Clock and Clear inputs
        q: out std_logic      -- Output
    );
end T_flipflop;

architecture beh of T_flipflop is
    signal temp: std_logic;  -- Signal to store the state of the flip-flop
begin
    toggle: process(t, clk, clr)
    begin
        if clr = '1' then
            temp <= '0';  -- Clear the flip-flop
        elsif rising_edge(clk) then
            if t = '1' then
                temp <= not temp;  -- Toggle the state
            else
                temp <= temp;  -- Maintain the current state when t = '0'
            end if;
        end if;
    end process toggle;

    q <= temp;  -- Output the current state
end beh;

