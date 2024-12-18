library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
    port (
        a1, a2, a3, a4: in integer;       -- Inputs of type integer
        s: in std_logic_vector(1 downto 0);  -- Select signal
        y: out integer                     -- Output of type integer
    );
end mux2;

architecture beh of mux2 is
begin
    -- Multiplexer logic based on the value of the select signal 's'
    process(s, a1, a2, a3, a4)
    begin
        case s is
            when "00" => y <= a1;   -- Select a1 when s = "00"
            when "01" => y <= a2;   -- Select a2 when s = "01"
            when "10" => y <= a3;   -- Select a3 when s = "10"
            when others => y <= a4; -- Select a4 when s = others
        end case;
    end process;
end beh;

