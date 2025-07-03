library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_testador is
end tb_testador;

architecture Behavioral of tb_testador is

    -- Component declaration (igual ao que está no seu projeto principal)
    component testador
        Port (
            valor : in  STD_LOGIC_VECTOR(7 downto 0);
            N     : in  STD_LOGIC_VECTOR(7 downto 0);
            saida : out STD_LOGIC
        );
    end component;

    -- Sinais para interligar com o componente
    signal valor_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal N_tb     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal saida_tb : STD_LOGIC;

begin
    -- Instância do componente
    uut: testador
        Port map (
            valor => valor_tb,
            N     => N_tb,
            saida => saida_tb
        );

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Teste 1: valor < N
        valor_tb <= "00000101";  -- 5
        N_tb     <= "00001000";  -- 8
        wait for 10 ns;

        -- Teste 2: valor = N
        valor_tb <= "00001000";  -- 8
        N_tb     <= "00001000";  -- 8
        wait for 10 ns;

        -- Teste 3: valor > N
        valor_tb <= "00001100";  -- 12
        N_tb     <= "00001000";  -- 8
        wait for 10 ns;

        -- Teste 4: valor = 0, N = 0
        valor_tb <= "00000000";
        N_tb     <= "00000000";
        wait for 10 ns;

        -- Teste 5: valor = 255, N = 255
        valor_tb <= "11111111";
        N_tb     <= "11111111";
        wait for 10 ns;

        -- Teste 6: valor = 255, N = 0
        valor_tb <= "11111111";
        N_tb     <= "00000000";
        wait for 10 ns;

        wait;  -- para a simulação
    end process;

end Behavioral;
