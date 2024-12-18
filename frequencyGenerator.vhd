library ieee;
use ieee.std_logic_1164.all;

entity frequencyGenerator is
    port(
        clk    : in std_logic;
        clr    : in std_logic;
        clkout : out std_logic
    );
end frequencyGenerator;

architecture beh of frequencyGenerator is
    signal count : integer := 0;
    signal div   : std_logic := '0';
begin
    con: process(clk, clr)
    begin
        if clr = '1' then
            count <= 0;
            div <= '0';
        elsif rising_edge(clk) then
            if count = 24 then
                count <= 0;
                div <= not div;
            else
                count <= count + 1;
            end if;
        end if;
    end process con;

    clkout <= div;

end beh;

