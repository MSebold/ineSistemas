-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture arch of testbench is 
	signal n : unsigned(7 downto 0) := "00000101";
    signal t : unsigned(7 downto 0) := "00000010";
    signal mAcu : std_logic := '0';
    signal eAcu : std_logic := '1';
    signal eT : std_logic := '1';
    signal clk : std_logic := '0';
    signal resultado : unsigned(7 downto 0);
begin
	
	expMod : entity work.design(arch)
    generic map(width => 8)
    port map(
    	N => n,
        T => t,
        mAcu => mAcu,
        eAcu => mAcu,
        eT => mAcu,
        clk => clk,
        resultado => resultado
    );
    
	process
    begin
    	clk <= not clk;
    	mAcu <= '0';
        eAcu <= '1';
        eT <= '1';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '0';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
        mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
         mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
         mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
         mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
         mAcu <= '1';
        eAcu <= '1';
        eT <= '0';
        clk <= not clk;
        wait for 20 ns;
    	wait;
    end process;
end architecture arch;
