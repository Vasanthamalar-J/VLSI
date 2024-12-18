library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_latch is
    port (
        d   : in  std_logic;
        clk : in  std_logic;
        clr : in  std_logic;
        q   : out std_logic;
        qb  : out std_logic
    );
end D_latch;

architecture beh of D_latch is
begin
    dlat : process(clk, clr, d)
    begin
        if clr = '1' then
            q  <= '0';
            qb <= '0';
        elsif clk = '1' then
            q  <= d;
            qb <= not d;
        end if;
    end process dlat;
end beh;

