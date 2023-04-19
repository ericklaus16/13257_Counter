library ieee;
use ieee.std_logic_1164.all;

entity tb_contador is
end entity;

architecture behaviour of tb_contador is
constant CLK_PERIOD : time := 20 ns;
component contador is
    port (
        rst : in std_logic;
        clk : in std_logic;

        s : out std_logic_vector(2 downto 0)
    );
end component;

signal srst : std_logic := '0';
signal sclk : std_logic := '0';

signal ss : std_logic_vector(2 downto 0);

begin
    u_cont : contador port map (srst, sclk, ss);

    u_tb : process 
    begin
        wait for CLK_PERIOD/2;
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
        srst <= '1';
    end process;
end architecture;