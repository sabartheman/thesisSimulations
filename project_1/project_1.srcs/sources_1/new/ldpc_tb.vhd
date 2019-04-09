----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2019 01:02:40 PM
-- Design Name: 
-- Module Name: ldpc_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.ldpcdec_fixpt_pkg.ALL;
USE work.ldpcdec_fixpt_tb_pkg.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ldpc_tb is
    --no port mapping since we are just simulating  
end ldpc_tb;




architecture Behavioral of ldpc_tb is


--hdlcoder generated code from matlab
component ldpcenc_fixpt IS
  PORT( m                                 :   IN    std_logic_vector(0 TO 3);  -- ufix1 [4]
        codedout                          :   OUT   std_logic_vector(0 TO 6)  -- ufix1 [7]
        );
END component;

--component ldpcdec_fixpt IS
--  PORT( r                                 :   IN    vector_of_std_logic_vector2(0 TO 6);  -- sfix2 [7]
--        iter                              :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
--        dec_out                           :   OUT   vector_of_std_logic_vector2(0 TO 6)  -- sfix2 [7]
--        );
--END component;



    signal clock        : std_logic := '0';   -- only for reference in waveforms
    
    --usually I would do 3 downto 0, but this is hdl's method
    signal input        : std_logic_vector(0 to 3);
    signal encodedout   : std_logic_vector(0 to 6); 
    signal decinput1     : std_logic_vector(0 to 6);
    signal decinput2     : std_logic_vector(0 to 6);
    signal decodeinput  : vector_of_std_logic_vector2(0 to 6);
    signal decodeout    : vector_of_std_logic_vector2(0 to 6);
    signal iter         : std_logic_vector(9 downto 0);


begin

iter <= std_logic_vector(to_unsigned(1000, iter'length));


ENC : ldpcenc_fixpt port map (
                    m =>            input,
                    codedout =>     encodedout);
                    


--DEC : ldpcdec_fixpt port map (
--                    r =>   decodeinput,
--                    iter => iter,
--                    dec_out => decodeout);


clock <= not clock after 10ns;
                    
                    
SETINPUT : process begin          --empty process list since I want to change after a set amount of time
            
    wait for 50ns;
    input <= "1010"; wait for 50ns;
    input <= "1110"; wait for 50ns;
    
--    decodeinput <= S("0011010")(0 to 6); wait for 50ns;

    decinput1 <= "0011010"; wait for 50ns;
    
    
    decinput2 <= "0101110"; wait for 50ns;
    
end process;


--    input1 : FOR i IN 0 TO 6 GENERATE
--        decodeinput(i) <= std_logic_vector(decinput1(i));
--    END GENERATE;


CHECKOUTPUT : process(encodedout) begin

    if(input = "1010") then
        if(encodedout = "0011010")then
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        else
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        end if;
        
    elsif(input = "1110") then
        if(encodedout = "0101110")then
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        else
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
            
        end if;
        
    end if;

end process;



end Behavioral;
