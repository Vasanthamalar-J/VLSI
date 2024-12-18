library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counterStop is
    port (
        clk  : in  std_logic;
        clr  : in  std_logic;
        din  : in  std_logic_vector(2 downto 0);
        dout : out std_logic_vector(2 downto 0)
    );
end counterStop;

architecture beh of counterStop is
    signal temp : std_logic_vector(2 downto 0);
begin
    cnt : process(clk, clr)
    begin
        if clr = '1' then
            temp <= din;
        elsif temp = "000" then
            temp <= temp;
        elsif rising_edge(clk) then
            temp <= temp + 1;
        end if;
    end process cnt;

    dout <= temp;
end beh;

