library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_1sec is
    port (
        clk   : in  std_logic;
        clr   : in  std_logic;
        din   : in  std_logic_vector(24 downto 0);
        dclk  : inout std_logic;
        d     : inout std_logic;
        q     : inout std_logic
    );
end counter_1sec;

architecture beh of counter_1sec is
    signal temp : std_logic_vector(24 downto 0);
begin

    cnt : process(clk, clr)
    begin
        if clr = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            temp <= temp + 1;
        end if;
    end process cnt;

    dclk <= temp(0) and not temp(1) and not temp(2) and temp(3) and temp(4) and not temp(5) and not temp(6) and not temp(7)
            and temp(8) and not temp(9) and not temp(10) and temp(11) and not temp(12) and temp(13) and temp(14)
            and not temp(15) and temp(16) and not temp(17) and not temp(18) and not temp(19) and not temp(20)
            and not temp(21) and not temp(22) and not temp(23) and not temp(24);

    d <= not q;

    dff : process(dclk, clr)
    begin
        if clr = '1' then
            q <= '0';
        elsif rising_edge(dclk) then
            q <= d;
        end if;
    end process dff;

end beh;

