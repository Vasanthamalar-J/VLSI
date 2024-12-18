library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andd is
    Port (
        a  , b : in  std_logic;
        y      : inout std_logic
    );
end andd;

architecture beh of andd is
begin
    -- Signal assignment
    y <= a and b;
end beh;

