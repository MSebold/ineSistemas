-------------------------------------------------
--	Description: Contém a descrição de uma entidade para um registrador com controle
--               de carga (sinal enable). O registrador armazena valores sem sinal
--               de N bits na borda de subida do clock, desde que `enable` esteja
--               em nível lógico alto. 
--               As entradas e saídas utilizam o tipo `unsigned`.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Registrador parametrizável para N bits com controle de enable.
-- O registrador atualiza sua saída `q` com o valor da entrada `d` na borda de
-- subida do sinal `clk`, apenas quando `enable = '1'`.
entity unsigned_register is
	generic(
		N : positive := 4 -- número de bits armazenados
	);
	port(
		clk, enable : in  std_logic;                -- clock (clk) e carga (enable)
		d           : in  unsigned(N - 1 downto 0); -- dado de entrada
		q           : out unsigned(N - 1 downto 0)  -- dado armazenado
	);
end unsigned_register;
architecture behavior OF unsigned_register is
begin
    PROCESS(clk)
    begin
    if rising_edge(clk) then
        if enable = '1' then
            q <= d;
        end if;
    end if;
    end process;
end architecture behavior;
