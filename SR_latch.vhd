library ieee;
use ieee.std_logic_1164.all;

entity SR_latch is
    port(
        s, r, clk, clr: in std_logic;  -- inputs: set (s), reset (r), clock (clk), clear (clr)
        q, qb: out std_logic            -- outputs: q and its complement qb
    );
end SR_latch;

architecture beh of SR_latch is
begin
    srlat: process(clk, clr, s, r)
    begin
        -- Active-low clear condition
        if clr = '1' then
            q <= '0';  -- reset output q
            qb <= '0'; -- reset output qb

        -- Clock-sensitive behavior
        elsif rising_edge(clk) then
            -- Case 1: No change in latch (s = '0' and r = '0')
            if s = '0' and r = '0' then
                q <= q;    -- maintain previous state (no change)
                qb <= qb;  -- maintain previous state (no change)

            -- Case 2: Reset condition (s = '0' and r = '1')
            elsif s = '0' and r = '1' then
                q <= '0';       -- reset output q
                qb <= not q;    -- qb is the complement of q

            -- Case 3: Set condition (s = '1' and r = '0')
            elsif s = '1' and r = '0' then
                q <= '1';       -- set output q
                qb <= not q;    -- qb is the complement of q

            -- Case 4: Invalid state (s = '1' and r = '1')
            else
                q <= 'X';  -- undefined state for an SR latch
                qb <= 'X'; -- undefined state for an SR latch
            end if;
        end if;
    end process srlat;
end beh;

