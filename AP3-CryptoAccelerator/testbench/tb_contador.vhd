-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_contador is
end tb_contador;

architecture arch of tb_contador is 
	signal e : unsigned(7 downto 0) := "00000101";
    signal mCont : std_logic := '0';
    signal eCont : std_logic := '1';
    signal parada : std_logic := '1';
    signal clk : std_logic := '0';
begin
	contador : entity work.contador(arch)
    generic map(width => 8)
    port map(
		clk => clk,
        E => e,
        mCont => mCont,
        eCont => eCont,
        parada => parada
    );
    
	process
    begin
    	clk <= not clk;
    	mCont <= '0';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
       
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
        
        clk <= not clk;
    	mCont <= '1';
        eCont <= '1';
        wait for 20 ns;
       
        wait;
    end process;
end architecture arch;
