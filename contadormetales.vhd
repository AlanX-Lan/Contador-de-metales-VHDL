library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contadormetales is
    port (
        clk : in std_logic;
        metal_detected : in std_logic;
        reset : in std_logic;
        seg : out std_logic_vector(6 downto 0)
    );
end entity contadormetales;

architecture Behavioral of contadormetales is

    signal counter : unsigned(3 downto 0) := (others => '0');
    signal display_digit : std_logic_vector(3 downto 0) := "1110"; -- Control de dígito a mostrar
    signal temp_seg : std_logic_vector(6 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= (others => '0'); -- Reiniciar el contador a 0
            elsif metal_detected = '1' then
                counter <= counter + 1;
                if counter > 9 then
                    counter <= (others => '0');
                end if;
            end if;
        end if;
    end process;

    process (counter)
    begin
        case counter is
            when "0000" => display_digit <= "0000"; -- 0
            when "0001" => display_digit <= "0001"; -- 1
            when "0010" => display_digit <= "0010"; -- 2
            when "0011" => display_digit <= "0011"; -- 3
            when "0100" => display_digit <= "0100"; -- 4
            when "0101" => display_digit <= "0101"; -- 5
            when "0110" => display_digit <= "0110"; -- 6
            when "0111" => display_digit <= "0111"; -- 7
            when "1000" => display_digit <= "1000"; -- 8
            when others => display_digit <= "1001"; -- 9
        end case;
    end process;

    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                temp_seg <= "1111111"; -- Apagar todos los segmentos por defecto
            else
                temp_seg <= "1111111"; -- Apagar todos los segmentos por defecto
                case display_digit is
                    when "0000" => temp_seg <= "1111110"; -- Segmento A
                    when "0001" => temp_seg <= "0110000"; -- Segmento B
                    when "0010" => temp_seg <= "1101101"; -- Segmento C
                    when "0011" => temp_seg <= "1111001"; -- Segmento D
                    when "0100" => temp_seg <= "0110011"; -- Segmento E
                    when "0101" => temp_seg <= "1011011"; -- Segmento F
                    when "0110" => temp_seg <= "1011111"; -- Segmento G
                    when "0111" => temp_seg <= "1110000"; -- Segmento DP
                    when others => temp_seg <= "1111111"; -- Apagar todos los segmentos
                end case;
            end if;
        end if;
    end process;

    seg <= temp_seg;

end architecture Behavioral;
