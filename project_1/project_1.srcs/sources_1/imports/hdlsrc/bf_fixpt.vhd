-- -------------------------------------------------------------
-- 
-- File Name: /home/sky/Documents/MATLAB/Low_density_parity_code/codegen/bf/hdlsrc/bf_fixpt.vhd
-- Created: 2019-04-23 21:44:53
-- 
-- Generated by MATLAB 9.5, MATLAB Coder 4.1 and HDL Coder 3.13
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: bf_fixpt
-- Source Path: bf_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.bf_fixpt_pkg.ALL;

ENTITY bf_fixpt IS
  PORT( r_1                               :   IN    std_logic_vector(0 TO 6);  -- ufix1 [7]
        iter                              :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        out_rsvd                          :   OUT   std_logic_vector(0 TO 6)  -- ufix1 [7]
        );
END bf_fixpt;


ARCHITECTURE rtl OF bf_fixpt IS

  -- Constants
  CONSTANT b0                             : std_logic_vector(0 TO 20) := 
    ('1', '1', '1', '0', '1', '0', '0', '1', '1', '0', '1', '0', '1', '0', '1', '0', '1', '1', '0', '0', '1');  -- ufix1 [21]
  CONSTANT b0_0                           : std_logic_vector(0 TO 20) := 
    ('1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '1');  -- ufix1 [21]

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL iter_unsigned                    : unsigned(6 DOWNTO 0);  -- ufix7

BEGIN
  iter_unsigned <= unsigned(iter);

  bf_fixpt_1_output : PROCESS (iter_unsigned, r_1)
    VARIABLE error_rsvd : std_logic_vector(0 TO 6);
    VARIABLE c : vector_of_unsigned5(0 TO 6);
    VARIABLE c_0 : vector_of_unsigned5(0 TO 2);
    VARIABLE r : std_logic_vector(0 TO 6);
    VARIABLE c_1 : vector_of_unsigned5(0 TO 2);
    VARIABLE iA : vector_of_unsigned8(0 TO 2);
    VARIABLE fiForTAggSI : vector_of_unsigned2(0 TO 2);
    VARIABLE c_2 : vector_of_unsigned5(0 TO 6);
    VARIABLE tmp : std_logic_vector(0 TO 6);
    VARIABLE flg : std_logic;
    VARIABLE error_rsvd_0 : std_logic_vector(0 TO 6);
    VARIABLE z1 : vector_of_unsigned8(0 TO 2);
    VARIABLE max : std_logic;
    VARIABLE cast : vector_of_signed32(0 TO 126);
    VARIABLE r_0 : std_logic_vector(0 TO 6);
    VARIABLE add_cast : vector_of_unsigned6(0 TO 6);
    VARIABLE ia_0 : vector_of_unsigned8(0 TO 2);
    VARIABLE cast_0 : vector_of_signed9(0 TO 2);
    VARIABLE mul_temp : vector_of_signed41(0 TO 2);
    VARIABLE sub_cast : vector_of_signed32(0 TO 2);
    VARIABLE sub_cast_0 : vector_of_unsigned8(0 TO 2);
    VARIABLE add_cast_0 : vector_of_unsigned6(0 TO 2);
  BEGIN
    --HDL code generation from MATLAB function: bf_fixpt
    --F2F: End block 
    --F2F: Start block
    --F2F: No information found for converting the following block of code
    --F2F: End block
    --F2F: Start block
    --F2F: No information found for converting the following block of code
    --F2F: End block
    --F2F: Start block
    --F2F: No information found for converting the following block of code
    -- tmp lists the number of failed parity checks for each bit
    error_rsvd := (OTHERS => '0');
    c := (OTHERS => to_unsigned(16#00#, 5));
    --check vector, will show which equations failed
    c_0 := (OTHERS => to_unsigned(16#00#, 5));
    --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    --                                                                          %
    --           Generated by MATLAB 9.5 and Fixed-Point Designer 6.2           %
    --                                                                          %
    --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    -- file name:    bf.m
    -- description:  out = bf(r,H,n) performs bit-flipping decoding for an ldpc code specified by the parity-check matrix H,
    --               where r is the received binary sequence, and n the number of decoding iterations.
    -- algorithm:    bit flipping decoding
    -- author:       y. jiang 
    -- modified:     Skylar Tamke
    -- date:         April 2019
    -- revision:     1.1
    --  r= logical(r);
    max := '0';
    r := r_1;

    FOR i IN 0 TO 126 LOOP
      cast(i) := signed(resize(iter_unsigned, 32));
      IF to_signed(i + 1, 32) <= cast(i) THEN 

        FOR m IN 0 TO 2 LOOP
          c_1(m) := c_0(m);

          FOR k IN 0 TO 6 LOOP
            IF r(k) = '1' THEN 
              r_0(k) := b0(k + (7 * m));
            ELSE 
              r_0(k) := '0';
            END IF;
            add_cast(k) := '0' & '0' & '0' & '0' & '0' & r_0(k);
            c_1(m) := resize(resize(c_1(m), 6) + add_cast(k), 5);
          END LOOP;

          iA(m) := resize(resize(c_1(m), 2), 8);
          ia_0(m) := iA(m) srl 1;
          cast_0(m) := signed(resize(ia_0(m), 9));
          -- CSD Encoding (2) : 10; Cost (Adders) = 0
          mul_temp(m) := resize(cast_0(m) & '0', 41);
          sub_cast(m) := mul_temp(m)(31 DOWNTO 0);
          sub_cast_0(m) := unsigned(sub_cast(m)(7 DOWNTO 0));
          z1(m) := iA(m) - sub_cast_0(m);
          IF z1(m)(7 DOWNTO 2) /= "000000" THEN 
            fiForTAggSI(m) := "11";
          ELSE 
            fiForTAggSI(m) := z1(m)(1 DOWNTO 0);
          END IF;
        END LOOP;

        flg := '0';

        FOR m_0 IN 0 TO 6 LOOP
          c_2(m_0) := c(m_0);

          FOR k_0 IN 0 TO 2 LOOP
            IF b0_0(k_0 + (3 * m_0)) = '1' THEN 
              add_cast_0(k_0) := resize(fiForTAggSI(k_0), 6);
            ELSE 
              add_cast_0(k_0) := to_unsigned(16#0#, 6);
            END IF;
            c_2(m_0) := resize(resize(c_2(m_0), 6) + add_cast_0(k_0), 5);
          END LOOP;

          tmp(m_0) := c_2(m_0)(0);
          flg := flg OR tmp(m_0);
          error_rsvd_0(m_0) := error_rsvd(m_0);
          IF (tmp(m_0) >= max) AND (tmp(m_0) > '0') THEN 
            error_rsvd_0(m_0) := tmp(m_0);
            max := tmp(m_0);
          END IF;
        END LOOP;


        FOR j IN 0 TO 6 LOOP
          IF (hdlcoder_to_stdlogic(error_rsvd_0(j) = max) AND flg) = '1' THEN 
            IF r(j) = '1' THEN 
              r(j) := '0';
            ELSE 
              r(j) := '1';
            END IF;
          END IF;
        END LOOP;

      END IF;
    END LOOP;

    out_rsvd <= r;
  END PROCESS bf_fixpt_1_output;


END rtl;

