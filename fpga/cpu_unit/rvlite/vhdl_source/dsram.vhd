----------------------------------------------------------------------------------------------
--
--      Input file         : dsram.vhd
--      Design name        : dsram
--      Author             : Tamar Kranenburg
--      Company            : Delft University of Technology
--                         : Faculty EEMCS, Department ME&CE
--                         : Systems and Circuits group
--
--      Description        : Dual Port Synchronous 'read after write' Ram. 1 Read Port and 1
--                           Write Port.
--
--
----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsram is
generic
(
    WIDTH : positive := 32;
    SIZE  : positive := 8
);
port
(
    dat_o   : out std_logic_vector(WIDTH - 1 downto 0);
    adr_i   : in std_logic_vector(SIZE - 1 downto 0);
    ena_i   : in std_logic;
    dat_w_i : in std_logic_vector(WIDTH - 1 downto 0);
    adr_w_i : in std_logic_vector(SIZE - 1 downto 0);
    wre_i   : in std_logic;
    clk_i   : in std_logic
);
end entity;

architecture arch of dsram is
    type ram_type is array(0 to 2 ** SIZE - 1) of std_logic_vector(WIDTH - 1 downto 0);
    signal ram :  ram_type := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of ram : signal is "auto";
begin
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if ena_i = '1' then
                dat_o <= ram(to_integer(unsigned(adr_i)));
            end if;
            if wre_i = '1' then
                ram(to_integer(unsigned(adr_w_i))) <= dat_w_i;
            end if;
        end if;
    end process;
end architecture;