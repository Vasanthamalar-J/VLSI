library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder is
    Port (
        d1, d2, d3, d4, d5, d6, d7 : in  std_logic;
        x, y, z                     : out std_logic
    );
end encoder;

architecture beh of encoder is
begin
    -- Signal assignments
    x <= d4 or d5 or d6 or d7;
    y <= d2 or d3 or d6 or d7;
    z <= d1 or d3 or d5 or d7;
end beh;

