library ieee;
use ieee.std_logic_1164.all;

entity cryptoacc_bc is
	port(
		clk, rst_a, start, parada   : in std_logic;
        mCont, eCont, mAcu, eAcu, eT, eR, disponivel : out std_logic
	);
end entity;

architecture behavior of cryptoacc_bc is
    type state is (S0, S1, S2, S3, S4);
    signal current_state, next_state : state := S0;
begin
    reg_state: PROCESS(clk, rst_a)
    BEGIN
        IF rst_a = '1' THEN
            current_state <= S0;
        ELSIF rising_edge(clk) THEN
            current_state <= next_state;
        END IF;
    END PROCESS reg_state;


    lpe: PROCESS(current_state, start)
    BEGIN
        CASE(current_state) IS
            WHEN S0 =>
                IF start = '1' THEN
                    next_state <= S1;
                ELSE
                    next_state <= S0;
                END IF;
            WHEN S1 =>
                next_state <= S2;
            WHEN S2 =>
                IF parada = '0' THEN
                    next_state <= S3;
                ELSE
                    next_state <= S4;
                END IF;
            WHEN S3 =>
                next_state <= S2;
            WHEN S4 =>
                next_state <= S0;
        END CASE;
    END PROCESS lpe;

    ls: PROCESS(current_state)
    BEGIN
        CASE(current_state) IS
            WHEN S0 =>
                eCont <= '0';
                eAcu <= '0';
                eT <= '0';
                disponivel <= '1';
                mCont <= '0';
                mAcu <= '0';
                eR <= '0';
            WHEN S1 =>
                -- Inicia as variaveis
                mCont <= '0';
                mAcu <= '0';
                eCont <= '1';
                eAcu <= '1';
                eT <= '1';
                disponivel <= '0';
                eR <= '0';
            WHEN S2 =>
                mCont <= '1';
                mAcu <= '1';
                eCont <= '0';
                eAcu <= '0';
                eT <= '0';
                disponivel <= '0';
                eR <= '0';
            WHEN S3 =>
                mCont <= '1';
                mAcu <= '1';
                eCont <= '1';
                eAcu <= '1';
                eT <= '0';
                disponivel <= '0';
                eR <= '0';
            WHEN S4 =>
                mCont <= '1';
                mAcu <= '1';
                eCont <= '0';
                eAcu <= '0';
                eT <= '0';
                disponivel <= '0';
                eR <= '1';
        END CASE;
    END PROCESS ls;
end architecture;
