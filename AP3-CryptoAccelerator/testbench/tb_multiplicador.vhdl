library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_multiplicador is
end tb_multiplicador;

architecture Behavioral of tb_multiplicador is

    -- Componente que será testado
    component multiplicador
        Port (
            A         : in  unsigned(7 downto 0);
            B         : in  unsigned(7 downto 0);
            N         : in  unsigned(7 downto 0);
            resultado : out unsigned(15 downto 0)
        );
    end component;

    -- Sinais para interligar com o componente
    signal A_tb         : unsigned(7 downto 0) := (others => '0');
    signal B_tb         : unsigned(7 downto 0) := (others => '0');
    signal N_tb         : unsigned(7 downto 0) := (others => '0');
    signal resultado_tb : unsigned(15 downto 0);

begin

    -- Instância do componente
    uut: multiplicador
        port map (
            A         => A_tb,
            B         => B_tb,
            N         => N_tb,
            resultado => resultado_tb
        );

    -- Processo de estímulo
    stim_proc: process
    begin
        -- Teste 1: 5 * 3 = 15
        A_tb <= "00000101";  -- 5
        B_tb <= "00000011";  -- 3
        N_tb <= "00001111";
        wait for 10 ns;

        -- Teste 2: 0 * 255 = 0
        A_tb <= "00000000";
        B_tb <= "11111111";
        wait for 10 ns;

        -- Teste 3: 15 * 10 = 150
        A_tb <= "00001111";  -- 15
        B_tb <= "00001010";  -- 10
        wait for 10 ns;

        -- Teste 4: 255 * 2 = 510
        A_tb <= "11111111";
        B_tb <= "00000010";
        wait for 10 ns;

        -- Teste 5: 255 * 255 = 65025
        A_tb <= "11111111";
        B_tb <= "11111111";
        wait for 10 ns;

        wait;  -- para a simulação
    end process;

end Behavioral;
