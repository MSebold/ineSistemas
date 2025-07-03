library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_montgomery_multiplier is
end tb_montgomery_multiplier;

architecture test of tb_montgomery_multiplier is
    constant WIDTH : integer := 8;

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal start    : std_logic := '0';
    signal A        : unsigned(WIDTH-1 downto 0);
    signal B        : unsigned(WIDTH-1 downto 0);
    signal N        : unsigned(WIDTH-1 downto 0);
    signal N_prime  : unsigned(WIDTH-1 downto 0);
    signal result   : unsigned(WIDTH-1 downto 0);
    signal ready    : std_logic;

    -- Clock period
    constant clk_period : time := 10 ns;

begin
    -- DUT instantiation
    uut: entity work.montgomery_multiplier
        generic map (WIDTH => WIDTH)
        port map (
            clk     => clk,
            reset   => reset,
            start   => start,
            A       => A,
            B       => B,
            N       => N,
            N_prime => N_prime,
            result  => result,
            ready   => ready
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
        -- Função auxiliar para calcular N'
        function modinv(n : integer; r : integer) return integer is
            variable t : integer := 0;
            variable newt : integer := 1;
            variable r0 : integer := r;
            variable newr : integer := n;
            variable quotient : integer;
            variable temp : integer;
        begin
            while newr /= 0 loop
                quotient := r0 / newr;
                temp := t;
                t := newt;
                newt := temp - quotient * newt;

                temp := r0;
                r0 := newr;
                newr := temp - quotient * newr;
            end loop;

            if r0 > 1 then
                return 0; -- Não invertível
            end if;
            if t < 0 then
                t := t + r;
            end if;
            return t;
        end function;

        -- Valores de teste
        constant a_int : integer := 23;
        constant b_int : integer := 17;
        constant n_int : integer := 97;
        constant r_int : integer := 2**WIDTH;
        variable n_inv : integer := 11;

    begin
        wait for 20 ns;

        reset <= '1';
        wait for clk_period;
        reset <= '0';

        -- Calcula N' = -N^{-1} mod R
        n_inv := modinv(n_int, r_int);
        n_inv := (-n_inv) mod r_int;

        -- Aplica estímulos
        A <= to_unsigned(a_int, WIDTH);
        B <= to_unsigned(b_int, WIDTH);
        N <= to_unsigned(n_int, WIDTH);
        N_prime <= to_unsigned(n_inv, WIDTH);

        start <= '1';
        wait for clk_period;
        start <= '0';

        -- Aguarda resultado
        wait until ready = '1';

        -- Mostra resultado
        report "Montgomery result = " & integer'image(to_integer(result));
        wait;
    end process;

end test;
