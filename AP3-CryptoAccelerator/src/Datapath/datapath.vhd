library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
	generic(
		width : positive := 8
	);
	port(
		E, N, T          : in  unsigned(width - 1 downto 0);
        eCont, eAcu, eT, eR : in std_logic;
        mCont, mAcu, clk : in std_logic;
        parada           : out std_logic;
        cipher           : out unsigned(width-1 downto 0)
	);
end datapath;

architecture arch of datapath is
begin

	contador : entity work.contador(arch)
    generic map(width => width)
	port map(
    	E => E,
		mCont => mCont,
        eCont => eCont,
        clk => clk,
        parada => parada
    );
    
    exponenciacao : entity work.exponenciacaoModular(arch)
    generic map(width => width)
    port map(
    	N => N,
		T => T,
		mAcu => mAcu,
        eAcu => eAcu,
        eT => eT,
        eR => eR,
        clk => clk,
        resultado => cipher
    );
    
end architecture arch;