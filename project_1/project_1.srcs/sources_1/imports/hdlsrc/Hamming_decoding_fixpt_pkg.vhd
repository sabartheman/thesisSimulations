-- -------------------------------------------------------------
-- 
-- File Name: /home/sky/Documents/MATLAB/Hamming/codegen/Hamming_decoding/hdlsrc/Hamming_decoding_fixpt_pkg.vhd
-- Created: 2019-04-03 10:39:54
-- 
-- Generated by MATLAB 9.5, MATLAB Coder 4.1 and HDL Coder 3.13
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE Hamming_decoding_fixpt_pkg IS
  TYPE vector_of_unsigned4 IS ARRAY (NATURAL RANGE <>) OF unsigned(3 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_unsigned3 IS ARRAY (NATURAL RANGE <>) OF unsigned(2 DOWNTO 0);
END Hamming_decoding_fixpt_pkg;
