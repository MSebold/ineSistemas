library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
	generic(
		width : positive := 8 -- número de bits das entradas e da saída
	);
	port(
		E : in  unsigned(width - 1 downto 0); -- entrada A com N bits com sinal
		mCont, eCont, clk : in std_logic;
        parada : out std_logic
	);
end contador;

architecture arch of contador is
	signal parada_int : std_logic;
	signal contmux, contReg, contDiff : unsigned(width-1 downto 0);
    signal passo : unsigned(width-1 downto 0);
begin

	passo <= to_unsigned(1,width);

    mux: entity work.mux_2to1
    generic map(N => width)
    port map(
        sel  => mCont,
        in_0 => e,
        in_1 => contDiff,
        y    => contMux
    );
    
    reg_cont : entity work.unsigned_register(behavior)
    generic map(N => width)
    port map(
        clk => clk,
        enable => eCont,
        d => contMux,
        q => contReg
    );
    
    diff : entity work.unsigned_difference(arch)
    generic map(N => width)
    port map(
        input_a => contReg,
        input_b => passo,
        difference => contDiff
    );
    
	zero : entity work.testadorZero(Behavioral)
    generic map(n => width)
    port map(
    	valor => contReg,
        saida => parada_int
    );
    
    parada <= parada_int;
    
end architecture arch;