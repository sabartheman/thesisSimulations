----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2019 03:04:19 PM
-- Design Name: 
-- Module Name: BCH_VHDL_tb - Behavioral
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

USE WORK.const.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity BCH_VHDL_tb is
  Port (A7_SYS_CLK_P        : in  BIT;
        rst_A7_n            : in  BIT;
        act_proc_out0       : in  BIT_VECTOR(0 TO 7);
        act_proc_out1       : out BIT_VECTOR(0 TO 7);
        act_proc_out2       : out BIT_VECTOR(0 TO 7)    
  
   );
end BCH_VHDL_tb;

architecture Behavioral of BCH_VHDL_tb is

component sim IS
PORT(clk, reset: IN BIT;
	din: IN BIT_VECTOR(0 TO k-1); 
	error: IN BIT_VECTOR(0 TO n-1);
	vdin, vdout, wrongNow, wrong: OUT BIT; 
	-- if wrong=1 - the circuit does not work properly 
	dout: OUT BIT_VECTOR(0 TO k-1));
END component;

signal clk,reset                    : BIT := '1';

signal input_data,output            : BIT_VECTOR(0 TO k-1);
signal error                        : BIT_VECTOR(0 TO n-1);
signal vdin,vdout,wrongNow,wrong    : BIT := '0';

attribute DONT_TOUCH : string;
-- Preserve the hierarchy of instance CLK1_rst_sync
attribute DONT_TOUCH of input_data: signal is "TRUE";
attribute DONT_TOUCH of sim     : component is "TRUE";






begin

clk <= not clk after 1ns;
--clk <= A7_SYS_CLK_P;
--reset <= rst_A7_n;

reset <= '0' after 25ns;

BCH_PROCESS : sim port map(
                clk  => clk,
                reset => reset,
                din => input_data,
                error => error,
                vdin => vdin,
                vdout => vdout,
                wrongNow => wrongNow,
                wrong => wrong,
                dout => output);

act_proc_out1 <= output(0 to 7);
act_proc_out2 <= output(8 to 10) & "00000"; 



INPUTDATA : process begin

    input_data <= "10001100111"; wait for 500ns;
    input_data <= "10000000111"; wait for 500ns;
--    input_data <= "00001111111"; wait for 200ns;
--    input_data <= "11110000111"; wait for 200ns;
--    input_data <= "10101100000"; wait for 200ns;
--    input_data <= "11001010000"; wait for 200ns;
--    input_data <= "10001100000"; wait for 200ns;
--    input_data <= "10001000000"; wait for 200ns;

end process;

--ERRDATA : process begin

--    error <= "000000100000000"; wait for 300ns;
--    error <= "001000000000000"; wait for 300ns;
--    error <= "000000001000000"; wait for 300ns;
--    error <= "000010000000000"; wait for 300ns;
--    error <= "000000000100000"; wait for 300ns;
--    error <= "000000000001000"; wait for 300ns;
--    error <= "000001000000000"; wait for 300ns;
--    error <= "100000000000000"; wait for 300ns;
--    error <= "000000000000100"; wait for 300ns;

--end process;


end Behavioral;
