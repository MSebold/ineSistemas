--------------------------------------------------
--	Description: Contém a descrição de uma entidade para subtração entre
--               dois valores com sinal de N bits. A saída `difference` será
--               o resultado de input_a - input_b. 
--               Todas as portas utilizam o tipo `signed`.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Subtrator com sinal (signed) parametrizável para N bits.
-- Calcula a diferença entre input_a e input_b.
-- A saída `difference` representa input_a - input_b.
entity unsigned_difference is
	generic(
		N : positive := 8 -- número de bits das entradas e da saída
	);
	port(
		input_a    : in  unsigned(N - 1 downto 0); -- entrada A com N bits com sinal
		input_b    : in  unsigned(N - 1 downto 0); -- entrada B com N bits com sinal
		difference : out unsigned(N - 1 downto 0)  -- saída da subtração
	);
end unsigned_difference;
architecture arch of unsigned_difference is
begin
    difference <= input_a - input_b;
    -- A arquitetura deve atribuir à saída `difference` o resultado da subtração
    -- entre input_a e input_b, utilizando tipos `signed` com tamanho N.
end architecture arch;