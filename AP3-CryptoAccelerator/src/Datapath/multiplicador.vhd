library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplicador is
    generic(
        s: positive := 16
    );
    Port (
        A         : in unsigned(s-1 downto 0);
        B         : in  unsigned(s-1 downto 0);
        N         : in  unsigned(s-1 downto 0);
        resultado : out unsigned(s-1 downto 0)
    );
end multiplicador;

architecture simpleModProduct of multiplicador is
begin
    process(A, B)
    begin
        -- converte A e B para unsigned, multiplica e converte de volta para vetor lógico
        resultado <= (A * B) mod N;
    end process;
end simpleModProduct;