library ieee;
use ieee.std_logic_1164.all;

entity decoder is
    port(
        a2, a1, a0: in std_logic;
        z0, z1, z2, z3, z4, z5, z6, z7: out std_logic
    );
end decoder;

architecture beh of decoder is
    signal x1, x2, x3: std_logic;
begin
    -- Inverting the inputs to generate intermediate signals
    x1 <= not a2;
    x2 <= not a1;
    x3 <= not a0;

    -- Generating the outputs based on the logic
    z0 <= x1 and x2 and x3;
    z1 <= x1 and x2 and a0;
    z2 <= x1 and a1 and x3;
    z3 <= x1 and a1 and a0;
    z4 <= a2 and x2 and x3;
    z5 <= a2 and x2 and a0;
    z6 <= a2 and a1 and x3;
    z7 <= a2 and a1 and a0;

end beh;

