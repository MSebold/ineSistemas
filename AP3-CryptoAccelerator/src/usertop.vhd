-- faz a conexão entre o controle e o datapath.

library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.numeric_std.all;

entity usertop is
	GENERIC (
		tamanhoMaximo : positive := 8
    	--tamanhoKeyN;
    	--tamanhoTexto;
    	--tamahoTextoCifrado;
    );
	port (
		clock: in std_logic;
		start: in std_logic;
		reset: in std_logic;
		key_e: in unsigned(tamanhoMaximo - 1 downto 0);
		key_n: in unsigned(tamanhoMaximo - 1 downto 0);
		texto: in unsigned(tamanhoMaximo - 1 downto 0);
		textoCifrado: out unsigned(tamanhoMaximo - 1 downto 0)
	);
end entity;

architecture arch of usertop is
	signal parada, mCont, eCont, mAcu, eAcu, eT, eR, disponivel: std_logic;
begin

	blocoControle : entity work.cryptoacc_bc(behavior)
    port map(
    	clk => clock,
        rst_a => reset,
        start => start,
        parada => parada,
        mCont => mCont,
        eCont => eCont,
        mAcu => mAcu,
        eAcu => eAcu,
        eT => eT,
        eR => eR,
        disponivel => disponivel
    );
    
    dp : entity work.datapath(arch)
    generic map(width => tamanhoMaximo)
    port map(
    	E => key_e,
        N => key_n,
        T => texto,
        eAcu => eAcu,
        eCont => eCont,
        eT => eT,
        eR => eR,
        mCont => mCont,
        mAcu => mAcu,
        clk => clock,
        parada => parada,
        cipher => textoCifrado
    );
end architecture;
