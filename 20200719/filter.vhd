-- -------------------------------------------------------------
--
-- Module: filter
-- Generated by MATLAB(R) 9.6 and Filter Design HDL Coder 3.1.5.
-- Generated on: 2020-07-18 21:49:10
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- TargetDirectory: C:\Users\Administrator\Desktop
-- TestBenchStimulus: impulse step ramp chirp noise 

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- Folding Factor        : 1
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time FIR Filter (real)
-- -------------------------------
-- Filter Structure  : Direct-Form FIR
-- Filter Length     : 51
-- Stable            : Yes
-- Linear Phase      : Yes (Type 1)
-- Arithmetic        : fixed
-- Numerator         : s16,16 -> [-5.000000e-01 5.000000e-01)
-- Input             : s12,0 -> [-2048 2048)
-- Filter Internals  : Specify Precision
--   Output          : s12,0 -> [-2048 2048)
--   Product         : s31,31 -> [-5.000000e-01 5.000000e-01)
--   Accumulator     : s34,31 -> [-4 4)
--   Round Mode      : convergent
--   Overflow Mode   : wrap
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY filter IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(11 DOWNTO 0); -- sfix12
         filter_out                      :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12
         );

END filter;


----------------------------------------------------------------
--Module Architecture: filter
----------------------------------------------------------------
ARCHITECTURE rtl OF filter IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF signed(11 DOWNTO 0); -- sfix12
  -- Constants
  CONSTANT coeff1                         : signed(15 DOWNTO 0) := to_signed(-60, 16); -- sfix16_En16
  CONSTANT coeff2                         : signed(15 DOWNTO 0) := to_signed(-178, 16); -- sfix16_En16
  CONSTANT coeff3                         : signed(15 DOWNTO 0) := to_signed(-163, 16); -- sfix16_En16
  CONSTANT coeff4                         : signed(15 DOWNTO 0) := to_signed(240, 16); -- sfix16_En16
  CONSTANT coeff5                         : signed(15 DOWNTO 0) := to_signed(895, 16); -- sfix16_En16
  CONSTANT coeff6                         : signed(15 DOWNTO 0) := to_signed(1137, 16); -- sfix16_En16
  CONSTANT coeff7                         : signed(15 DOWNTO 0) := to_signed(502, 16); -- sfix16_En16
  CONSTANT coeff8                         : signed(15 DOWNTO 0) := to_signed(-430, 16); -- sfix16_En16
  CONSTANT coeff9                         : signed(15 DOWNTO 0) := to_signed(-504, 16); -- sfix16_En16
  CONSTANT coeff10                        : signed(15 DOWNTO 0) := to_signed(400, 16); -- sfix16_En16
  CONSTANT coeff11                        : signed(15 DOWNTO 0) := to_signed(909, 16); -- sfix16_En16
  CONSTANT coeff12                        : signed(15 DOWNTO 0) := to_signed(23, 16); -- sfix16_En16
  CONSTANT coeff13                        : signed(15 DOWNTO 0) := to_signed(-1108, 16); -- sfix16_En16
  CONSTANT coeff14                        : signed(15 DOWNTO 0) := to_signed(-584, 16); -- sfix16_En16
  CONSTANT coeff15                        : signed(15 DOWNTO 0) := to_signed(1143, 16); -- sfix16_En16
  CONSTANT coeff16                        : signed(15 DOWNTO 0) := to_signed(1360, 16); -- sfix16_En16
  CONSTANT coeff17                        : signed(15 DOWNTO 0) := to_signed(-806, 16); -- sfix16_En16
  CONSTANT coeff18                        : signed(15 DOWNTO 0) := to_signed(-2244, 16); -- sfix16_En16
  CONSTANT coeff19                        : signed(15 DOWNTO 0) := to_signed(-68, 16); -- sfix16_En16
  CONSTANT coeff20                        : signed(15 DOWNTO 0) := to_signed(3132, 16); -- sfix16_En16
  CONSTANT coeff21                        : signed(15 DOWNTO 0) := to_signed(1793, 16); -- sfix16_En16
  CONSTANT coeff22                        : signed(15 DOWNTO 0) := to_signed(-3891, 16); -- sfix16_En16
  CONSTANT coeff23                        : signed(15 DOWNTO 0) := to_signed(-5394, 16); -- sfix16_En16
  CONSTANT coeff24                        : signed(15 DOWNTO 0) := to_signed(4403, 16); -- sfix16_En16
  CONSTANT coeff25                        : signed(15 DOWNTO 0) := to_signed(20317, 16); -- sfix16_En16
  CONSTANT coeff26                        : signed(15 DOWNTO 0) := to_signed(28184, 16); -- sfix16_En16
  CONSTANT coeff27                        : signed(15 DOWNTO 0) := to_signed(20317, 16); -- sfix16_En16
  CONSTANT coeff28                        : signed(15 DOWNTO 0) := to_signed(4403, 16); -- sfix16_En16
  CONSTANT coeff29                        : signed(15 DOWNTO 0) := to_signed(-5394, 16); -- sfix16_En16
  CONSTANT coeff30                        : signed(15 DOWNTO 0) := to_signed(-3891, 16); -- sfix16_En16
  CONSTANT coeff31                        : signed(15 DOWNTO 0) := to_signed(1793, 16); -- sfix16_En16
  CONSTANT coeff32                        : signed(15 DOWNTO 0) := to_signed(3132, 16); -- sfix16_En16
  CONSTANT coeff33                        : signed(15 DOWNTO 0) := to_signed(-68, 16); -- sfix16_En16
  CONSTANT coeff34                        : signed(15 DOWNTO 0) := to_signed(-2244, 16); -- sfix16_En16
  CONSTANT coeff35                        : signed(15 DOWNTO 0) := to_signed(-806, 16); -- sfix16_En16
  CONSTANT coeff36                        : signed(15 DOWNTO 0) := to_signed(1360, 16); -- sfix16_En16
  CONSTANT coeff37                        : signed(15 DOWNTO 0) := to_signed(1143, 16); -- sfix16_En16
  CONSTANT coeff38                        : signed(15 DOWNTO 0) := to_signed(-584, 16); -- sfix16_En16
  CONSTANT coeff39                        : signed(15 DOWNTO 0) := to_signed(-1108, 16); -- sfix16_En16
  CONSTANT coeff40                        : signed(15 DOWNTO 0) := to_signed(23, 16); -- sfix16_En16
  CONSTANT coeff41                        : signed(15 DOWNTO 0) := to_signed(909, 16); -- sfix16_En16
  CONSTANT coeff42                        : signed(15 DOWNTO 0) := to_signed(400, 16); -- sfix16_En16
  CONSTANT coeff43                        : signed(15 DOWNTO 0) := to_signed(-504, 16); -- sfix16_En16
  CONSTANT coeff44                        : signed(15 DOWNTO 0) := to_signed(-430, 16); -- sfix16_En16
  CONSTANT coeff45                        : signed(15 DOWNTO 0) := to_signed(502, 16); -- sfix16_En16
  CONSTANT coeff46                        : signed(15 DOWNTO 0) := to_signed(1137, 16); -- sfix16_En16
  CONSTANT coeff47                        : signed(15 DOWNTO 0) := to_signed(895, 16); -- sfix16_En16
  CONSTANT coeff48                        : signed(15 DOWNTO 0) := to_signed(240, 16); -- sfix16_En16
  CONSTANT coeff49                        : signed(15 DOWNTO 0) := to_signed(-163, 16); -- sfix16_En16
  CONSTANT coeff50                        : signed(15 DOWNTO 0) := to_signed(-178, 16); -- sfix16_En16
  CONSTANT coeff51                        : signed(15 DOWNTO 0) := to_signed(-60, 16); -- sfix16_En16

  -- Signals
  SIGNAL delay_pipeline                   : delay_pipeline_type(0 TO 50); -- sfix12
  SIGNAL product51                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp                         : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product50                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_1                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product49                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_2                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product48                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_3                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product47                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_4                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product46                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_5                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product45                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_6                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product44                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_7                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product43                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_8                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product42                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_9                       : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product41                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_10                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product40                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_11                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product39                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_12                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product38                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_13                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product37                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_14                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product36                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_15                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product35                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_16                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product34                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_17                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product33                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_18                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product32                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_19                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product31                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_20                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product30                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_21                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product29                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_22                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product28                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_23                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product27                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_24                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product26                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_25                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product25                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_26                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product24                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_27                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product23                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_28                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product22                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_29                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product21                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_30                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product20                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_31                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product19                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_32                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product18                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_33                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product17                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_34                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product16                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_35                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product15                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_36                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product14                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_37                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product13                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_38                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product12                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_39                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product11                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_40                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product10                        : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_41                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product9                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_42                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product8                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_43                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product7                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_44                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product6                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_45                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product5                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_46                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product4                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_47                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product3                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_48                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product2                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_49                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL product1_cast                    : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL product1                         : signed(30 DOWNTO 0); -- sfix31_En31
  SIGNAL mul_temp_50                      : signed(27 DOWNTO 0); -- sfix28_En16
  SIGNAL sum1                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp                         : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum2                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_1                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum3                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_2                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum4                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_3                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum5                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_4                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum6                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_5                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum7                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_6                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum8                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_7                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum9                             : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_8                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum10                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_9                       : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum11                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_10                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum12                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_11                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum13                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_12                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum14                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_13                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum15                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_14                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum16                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_15                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum17                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_16                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum18                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_17                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum19                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_18                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum20                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_19                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum21                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_20                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum22                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_21                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum23                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_22                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum24                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_23                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum25                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_24                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum26                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_25                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum27                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_26                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum28                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_27                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum29                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_28                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum30                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_29                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum31                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_30                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum32                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_31                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum33                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_32                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum34                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_33                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum35                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_34                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum36                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_35                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum37                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_36                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum38                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_37                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum39                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_38                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum40                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_39                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum41                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_40                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum42                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_41                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum43                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_42                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum44                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_43                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum45                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_44                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum46                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_45                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum47                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_46                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum48                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_47                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum49                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_48                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL sum50                            : signed(33 DOWNTO 0); -- sfix34_En31
  SIGNAL add_temp_49                      : signed(34 DOWNTO 0); -- sfix35_En31
  SIGNAL output_typeconvert               : signed(11 DOWNTO 0); -- sfix12
  SIGNAL output_register                  : signed(11 DOWNTO 0); -- sfix12


BEGIN

  -- Block Statements
  Delay_Pipeline_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_pipeline(0 TO 50) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_pipeline(0) <= signed(filter_in);
        delay_pipeline(1 TO 50) <= delay_pipeline(0 TO 49);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_process;

  mul_temp <= delay_pipeline(50) * coeff51;
  product51 <= resize(mul_temp(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_1 <= delay_pipeline(49) * coeff50;
  product50 <= resize(mul_temp_1(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_2 <= delay_pipeline(48) * coeff49;
  product49 <= resize(mul_temp_2(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_3 <= delay_pipeline(47) * coeff48;
  product48 <= resize(mul_temp_3(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_4 <= delay_pipeline(46) * coeff47;
  product47 <= resize(mul_temp_4(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_5 <= delay_pipeline(45) * coeff46;
  product46 <= resize(mul_temp_5(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_6 <= delay_pipeline(44) * coeff45;
  product45 <= resize(mul_temp_6(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_7 <= delay_pipeline(43) * coeff44;
  product44 <= resize(mul_temp_7(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_8 <= delay_pipeline(42) * coeff43;
  product43 <= resize(mul_temp_8(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_9 <= delay_pipeline(41) * coeff42;
  product42 <= resize(mul_temp_9(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_10 <= delay_pipeline(40) * coeff41;
  product41 <= resize(mul_temp_10(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_11 <= delay_pipeline(39) * coeff40;
  product40 <= resize(mul_temp_11(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_12 <= delay_pipeline(38) * coeff39;
  product39 <= resize(mul_temp_12(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_13 <= delay_pipeline(37) * coeff38;
  product38 <= resize(mul_temp_13(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_14 <= delay_pipeline(36) * coeff37;
  product37 <= resize(mul_temp_14(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_15 <= delay_pipeline(35) * coeff36;
  product36 <= resize(mul_temp_15(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_16 <= delay_pipeline(34) * coeff35;
  product35 <= resize(mul_temp_16(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_17 <= delay_pipeline(33) * coeff34;
  product34 <= resize(mul_temp_17(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_18 <= delay_pipeline(32) * coeff33;
  product33 <= resize(mul_temp_18(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_19 <= delay_pipeline(31) * coeff32;
  product32 <= resize(mul_temp_19(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_20 <= delay_pipeline(30) * coeff31;
  product31 <= resize(mul_temp_20(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_21 <= delay_pipeline(29) * coeff30;
  product30 <= resize(mul_temp_21(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_22 <= delay_pipeline(28) * coeff29;
  product29 <= resize(mul_temp_22(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_23 <= delay_pipeline(27) * coeff28;
  product28 <= resize(mul_temp_23(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_24 <= delay_pipeline(26) * coeff27;
  product27 <= resize(mul_temp_24(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_25 <= delay_pipeline(25) * coeff26;
  product26 <= resize(mul_temp_25(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_26 <= delay_pipeline(24) * coeff25;
  product25 <= resize(mul_temp_26(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_27 <= delay_pipeline(23) * coeff24;
  product24 <= resize(mul_temp_27(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_28 <= delay_pipeline(22) * coeff23;
  product23 <= resize(mul_temp_28(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_29 <= delay_pipeline(21) * coeff22;
  product22 <= resize(mul_temp_29(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_30 <= delay_pipeline(20) * coeff21;
  product21 <= resize(mul_temp_30(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_31 <= delay_pipeline(19) * coeff20;
  product20 <= resize(mul_temp_31(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_32 <= delay_pipeline(18) * coeff19;
  product19 <= resize(mul_temp_32(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_33 <= delay_pipeline(17) * coeff18;
  product18 <= resize(mul_temp_33(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_34 <= delay_pipeline(16) * coeff17;
  product17 <= resize(mul_temp_34(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_35 <= delay_pipeline(15) * coeff16;
  product16 <= resize(mul_temp_35(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_36 <= delay_pipeline(14) * coeff15;
  product15 <= resize(mul_temp_36(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_37 <= delay_pipeline(13) * coeff14;
  product14 <= resize(mul_temp_37(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_38 <= delay_pipeline(12) * coeff13;
  product13 <= resize(mul_temp_38(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_39 <= delay_pipeline(11) * coeff12;
  product12 <= resize(mul_temp_39(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_40 <= delay_pipeline(10) * coeff11;
  product11 <= resize(mul_temp_40(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_41 <= delay_pipeline(9) * coeff10;
  product10 <= resize(mul_temp_41(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_42 <= delay_pipeline(8) * coeff9;
  product9 <= resize(mul_temp_42(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_43 <= delay_pipeline(7) * coeff8;
  product8 <= resize(mul_temp_43(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_44 <= delay_pipeline(6) * coeff7;
  product7 <= resize(mul_temp_44(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_45 <= delay_pipeline(5) * coeff6;
  product6 <= resize(mul_temp_45(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_46 <= delay_pipeline(4) * coeff5;
  product5 <= resize(mul_temp_46(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_47 <= delay_pipeline(3) * coeff4;
  product4 <= resize(mul_temp_47(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_48 <= delay_pipeline(2) * coeff3;
  product3 <= resize(mul_temp_48(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  mul_temp_49 <= delay_pipeline(1) * coeff2;
  product2 <= resize(mul_temp_49(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  product1_cast <= resize(product1, 34);

  mul_temp_50 <= delay_pipeline(0) * coeff1;
  product1 <= resize(mul_temp_50(15 DOWNTO 0) & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 31);

  add_temp <= resize(product1_cast, 35) + resize(product2, 35);
  sum1 <= add_temp(33 DOWNTO 0);

  add_temp_1 <= resize(sum1, 35) + resize(product3, 35);
  sum2 <= add_temp_1(33 DOWNTO 0);

  add_temp_2 <= resize(sum2, 35) + resize(product4, 35);
  sum3 <= add_temp_2(33 DOWNTO 0);

  add_temp_3 <= resize(sum3, 35) + resize(product5, 35);
  sum4 <= add_temp_3(33 DOWNTO 0);

  add_temp_4 <= resize(sum4, 35) + resize(product6, 35);
  sum5 <= add_temp_4(33 DOWNTO 0);

  add_temp_5 <= resize(sum5, 35) + resize(product7, 35);
  sum6 <= add_temp_5(33 DOWNTO 0);

  add_temp_6 <= resize(sum6, 35) + resize(product8, 35);
  sum7 <= add_temp_6(33 DOWNTO 0);

  add_temp_7 <= resize(sum7, 35) + resize(product9, 35);
  sum8 <= add_temp_7(33 DOWNTO 0);

  add_temp_8 <= resize(sum8, 35) + resize(product10, 35);
  sum9 <= add_temp_8(33 DOWNTO 0);

  add_temp_9 <= resize(sum9, 35) + resize(product11, 35);
  sum10 <= add_temp_9(33 DOWNTO 0);

  add_temp_10 <= resize(sum10, 35) + resize(product12, 35);
  sum11 <= add_temp_10(33 DOWNTO 0);

  add_temp_11 <= resize(sum11, 35) + resize(product13, 35);
  sum12 <= add_temp_11(33 DOWNTO 0);

  add_temp_12 <= resize(sum12, 35) + resize(product14, 35);
  sum13 <= add_temp_12(33 DOWNTO 0);

  add_temp_13 <= resize(sum13, 35) + resize(product15, 35);
  sum14 <= add_temp_13(33 DOWNTO 0);

  add_temp_14 <= resize(sum14, 35) + resize(product16, 35);
  sum15 <= add_temp_14(33 DOWNTO 0);

  add_temp_15 <= resize(sum15, 35) + resize(product17, 35);
  sum16 <= add_temp_15(33 DOWNTO 0);

  add_temp_16 <= resize(sum16, 35) + resize(product18, 35);
  sum17 <= add_temp_16(33 DOWNTO 0);

  add_temp_17 <= resize(sum17, 35) + resize(product19, 35);
  sum18 <= add_temp_17(33 DOWNTO 0);

  add_temp_18 <= resize(sum18, 35) + resize(product20, 35);
  sum19 <= add_temp_18(33 DOWNTO 0);

  add_temp_19 <= resize(sum19, 35) + resize(product21, 35);
  sum20 <= add_temp_19(33 DOWNTO 0);

  add_temp_20 <= resize(sum20, 35) + resize(product22, 35);
  sum21 <= add_temp_20(33 DOWNTO 0);

  add_temp_21 <= resize(sum21, 35) + resize(product23, 35);
  sum22 <= add_temp_21(33 DOWNTO 0);

  add_temp_22 <= resize(sum22, 35) + resize(product24, 35);
  sum23 <= add_temp_22(33 DOWNTO 0);

  add_temp_23 <= resize(sum23, 35) + resize(product25, 35);
  sum24 <= add_temp_23(33 DOWNTO 0);

  add_temp_24 <= resize(sum24, 35) + resize(product26, 35);
  sum25 <= add_temp_24(33 DOWNTO 0);

  add_temp_25 <= resize(sum25, 35) + resize(product27, 35);
  sum26 <= add_temp_25(33 DOWNTO 0);

  add_temp_26 <= resize(sum26, 35) + resize(product28, 35);
  sum27 <= add_temp_26(33 DOWNTO 0);

  add_temp_27 <= resize(sum27, 35) + resize(product29, 35);
  sum28 <= add_temp_27(33 DOWNTO 0);

  add_temp_28 <= resize(sum28, 35) + resize(product30, 35);
  sum29 <= add_temp_28(33 DOWNTO 0);

  add_temp_29 <= resize(sum29, 35) + resize(product31, 35);
  sum30 <= add_temp_29(33 DOWNTO 0);

  add_temp_30 <= resize(sum30, 35) + resize(product32, 35);
  sum31 <= add_temp_30(33 DOWNTO 0);

  add_temp_31 <= resize(sum31, 35) + resize(product33, 35);
  sum32 <= add_temp_31(33 DOWNTO 0);

  add_temp_32 <= resize(sum32, 35) + resize(product34, 35);
  sum33 <= add_temp_32(33 DOWNTO 0);

  add_temp_33 <= resize(sum33, 35) + resize(product35, 35);
  sum34 <= add_temp_33(33 DOWNTO 0);

  add_temp_34 <= resize(sum34, 35) + resize(product36, 35);
  sum35 <= add_temp_34(33 DOWNTO 0);

  add_temp_35 <= resize(sum35, 35) + resize(product37, 35);
  sum36 <= add_temp_35(33 DOWNTO 0);

  add_temp_36 <= resize(sum36, 35) + resize(product38, 35);
  sum37 <= add_temp_36(33 DOWNTO 0);

  add_temp_37 <= resize(sum37, 35) + resize(product39, 35);
  sum38 <= add_temp_37(33 DOWNTO 0);

  add_temp_38 <= resize(sum38, 35) + resize(product40, 35);
  sum39 <= add_temp_38(33 DOWNTO 0);

  add_temp_39 <= resize(sum39, 35) + resize(product41, 35);
  sum40 <= add_temp_39(33 DOWNTO 0);

  add_temp_40 <= resize(sum40, 35) + resize(product42, 35);
  sum41 <= add_temp_40(33 DOWNTO 0);

  add_temp_41 <= resize(sum41, 35) + resize(product43, 35);
  sum42 <= add_temp_41(33 DOWNTO 0);

  add_temp_42 <= resize(sum42, 35) + resize(product44, 35);
  sum43 <= add_temp_42(33 DOWNTO 0);

  add_temp_43 <= resize(sum43, 35) + resize(product45, 35);
  sum44 <= add_temp_43(33 DOWNTO 0);

  add_temp_44 <= resize(sum44, 35) + resize(product46, 35);
  sum45 <= add_temp_44(33 DOWNTO 0);

  add_temp_45 <= resize(sum45, 35) + resize(product47, 35);
  sum46 <= add_temp_45(33 DOWNTO 0);

  add_temp_46 <= resize(sum46, 35) + resize(product48, 35);
  sum47 <= add_temp_46(33 DOWNTO 0);

  add_temp_47 <= resize(sum47, 35) + resize(product49, 35);
  sum48 <= add_temp_47(33 DOWNTO 0);

  add_temp_48 <= resize(sum48, 35) + resize(product50, 35);
  sum49 <= add_temp_48(33 DOWNTO 0);

  add_temp_49 <= resize(sum49, 35) + resize(product51, 35);
  sum50 <= add_temp_49(33 DOWNTO 0);

  output_typeconvert <= resize(shift_right(sum50(33) & sum50(33 DOWNTO 0) + ( "0" & (sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31) & NOT sum50(31))), 31), 12);

  Output_Register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        output_register <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS Output_Register_process;

  -- Assignment Statements
  filter_out <= std_logic_vector(output_register);
END rtl;
