library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flipflop is
    port (
        clk : in  std_logic;
        clr : in  std_logic;
        q   : out std_logic
    );
end D_flipflop;

architecture beh of D_flipflop is
    signal d : std_logic;
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

