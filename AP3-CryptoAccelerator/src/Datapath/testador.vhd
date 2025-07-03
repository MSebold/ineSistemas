library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testadorZero is
	generic(
		N : positive := 8 -- número de bits das entradas e da saída
    );
    Port (
        valor : in  unsigned(N-1 downto 0); -- valor de entrada
        saida : out STD_LOGIC               -- '1' se valor == 0
    );
end testadorZero;

architecture Behavioral of testadorZero is
begin
    process(valor)
    begin
        if (valor = to_unsigned(1, N)) then
            saida <= '1';
        else
            saida <= '0';
        end if;
    end process;
end Behavioral;
