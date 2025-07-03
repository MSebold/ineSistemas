-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture arch of testbench is 
	signal e : unsigned(15 downto 0) := "0000000000000101"; -- 5
    signal n : unsigned(15 downto 0) := "0000000110110101"; -- 437
    signal t : unsigned(15 downto 0) := "0000000000001100"; -- 12
    signal stop : std_logic := '1';
    signal clk1 : std_logic := '0';
    signal start : std_logic := '0';
    signal reset : std_logic := '0';
    signal textoCifrado : unsigned(15 downto 0);
begin
	
    
    
	usertop : entity work.desing(arch)
    generic map(tamanhoMaximo => 16)
    port map(
		clock => clk1,
        key_e => e,
        key_n => n,
        texto => t,
        start => start,
        reset => reset,
        textoCifrado => textoCifrado
    );
    
	process
    begin
    
        clk1 <= not clk1;
        wait for 50 ns;
        
        start <= not start;
        clk1 <= not clk1;
        wait for 50 ns;
        
        start <= not start;
        clk1 <= not clk1;
        wait for 50 ns;
        
    
    	for i in 0 to 100 loop
    		clk1 <= not clk1;
        	wait for 50 ns;
       end loop;
       wait;
    end process;
    
end architecture arch;
