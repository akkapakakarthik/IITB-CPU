library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
    port (
        A, B      : in std_logic_vector(15 downto 0); -- 16-bit operands
        opcode    : in std_logic_vector(2 downto 0);  -- 3-bit opcode
        C         : out std_logic_vector(15 downto 0);-- Result
        z_flag    : out std_logic                    -- Zero flag
    );
end entity ALU;

architecture Struct of ALU is
    signal result : std_logic_vector(15 downto 0); -- Internal result signal
begin
    process(A, B, opcode)
        variable temp_result : signed(15 downto 0); -- Temporary variable
    begin
        if opcode(2) = '0' then -- Arithmetic Operations
            case opcode(1 downto 0) is
                when "00" => temp_result := signed(A) + signed(B); -- ADD
                when "10" => temp_result := signed(A) - signed(B); -- SUB
                when "11" => -- MUL (4-bit multiplication)
                    temp_result := resize(signed(A(3 downto 0)) * signed(B(3 downto 0)), 16);
                when others => temp_result := signed(A); -- Default case
            end case;
            result <= std_logic_vector(temp_result);
        else -- Logical Operations
            case opcode(1 downto 0) is
                when "00" => result <= A and B; -- AND
                when "01" => result <= A or B;  -- ORA
                when "10" => result <= (not A) or B; -- IMP
                when others => result <= A;    -- Default case
            end case;
        end if;
    end process;

    -- Assign outputs
    C <= result;
    z_flag <= '1' when result = "0000000000000000" else '0'; -- Zero flag
end architecture Struct;