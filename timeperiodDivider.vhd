library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity timeperiodDivider is
    port (
        clk : in  std_logic;
        clr : in  std_logic;
        d   : inout std_logic;
        q   : inout std_logic
    );
end timeperiodDivider;

architecture beh of timeperiodDivider is
begin
    d <= not q;

    dff : process(clk, clr)
    begin
        if clr = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process dff;
end beh;

