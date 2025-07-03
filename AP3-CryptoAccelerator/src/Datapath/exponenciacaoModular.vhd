library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity exponenciacaoModular is
	generic(
		width : positive := 8 -- número de bits das entradas e da saída
	);
	port(
		N : in  unsigned(width - 1 downto 0); -- entrada A com N bits com sinal
		T : in  unsigned(width - 1 downto 0); -- entrada B com N bits com sinal
		mAcu, eAcu, eT, clk, eR : in std_logic;
        resultado : out unsigned(width-1 downto 0)
	);
end exponenciacaoModular;

architecture arch of exponenciacaoModular is
	signal start_v, resultado_produto : unsigned(width-1 downto 0);
    signal acumulado_unsigned, prod1_unsigned, prod2_unsigned : unsigned(width-1 downto 0) := (others => '0');
begin

	start_v	<= to_unsigned(1,width);

    mux: entity work.mux_2to1
    generic map(N => width)
    port map(
        sel  => mAcu,
        in_0 => start_v,
        in_1 => resultado_produto,
        y    => prod1_unsigned
    );
    
    reg_acumulador : entity work.unsigned_register(behavior)
    generic map(N => width)
    port map(
        clk => clk,
        enable => eAcu,
        d => prod1_unsigned,
        q => acumulado_unsigned
    );
    
    reg_base : entity work.unsigned_register(behavior)
    generic map(N => width)
    port map(
        clk => clk,
        enable => eT,
        d => T,
        q => prod2_unsigned
    );
    
    multiplicadorModular : entity work.multiplicador(simpleModProduct)
    generic map(s => width)
    port map(
        A => acumulado_unsigned,
        B => prod2_unsigned,
        N => N,
        resultado => resultado_produto
    );
    
    --reg_result : entity work.unsigned_register(behavior)
    --generic map(N => width)
    --port map(
    --    clk => clk,
    --    enable => eR,
    --    d => acumulado_unsigned,
    --    q => resultado
    --);    
    
    resultado <= acumulado_unsigned;
    
end architecture arch;