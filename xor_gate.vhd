library ieee;
use ieee.std_logic_1164.all;

-- Define the entity with the correct name
entity xor_gate is 
    port(
        a, b: in std_logic;    -- Inputs: a and b
        y: out std_logic       -- Output: y
    );
end xor_gate;

architecture beh of xor_gate is
begin
    y <= a xor b;
end beh;

