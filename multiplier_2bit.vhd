library ieee;
use ieee.std_logic_1164.all;

entity multiplier_2bit is
    port(
        a, b: in std_logic_vector(1 downto 0);
        o: out std_logic_vector(4 downto 1)
    );
end multiplier_2bit;

architecture beh of multiplier_2bit is
    -- Intermediate signals for storing partial product bits
    signal x, y, z, w: std_logic;
begin
    -- Bitwise multiplication and sum operations
    o(1) <= a(0) and b(0);          -- Least significant bit of the product

    x <= a(0) and b(1);             -- Partial product for bit 2
    y <= a(1) and b(0);             -- Partial product for bit 3

    o(2) <= x xor y;                -- Sum bit for bit 2

    z <= x and y;                   -- Carry for bit 2 and 3
    w <= a(1) and b(1);             -- Partial product for bit 4

    o(3) <= z xor w;                -- Sum bit for bit 3

    o(4) <= z and w;                -- Carry for the most significant bit
end beh;

