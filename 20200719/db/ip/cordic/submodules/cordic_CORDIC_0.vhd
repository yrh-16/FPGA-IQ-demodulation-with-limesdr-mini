-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 15.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2015 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_CORDIC_0
-- VHDL created on Mon Jul 20 20:44:43 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_CORDIC_0 is
    port (
        x : in std_logic_vector(11 downto 0);  -- sfix12
        y : in std_logic_vector(11 downto 0);  -- sfix12
        q : out std_logic_vector(11 downto 0);  -- sfix12_en9
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_CORDIC_0;

architecture normal of cordic_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_atan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cstArcTan2Mi_0_uid20_atan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_1_uid21_atan2Test_a : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_1_uid21_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_1_uid21_atan2Test_o : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_1_uid21_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yip1E_1_uid22_atan2Test_a : STD_LOGIC_VECTOR (12 downto 0);
    signal yip1E_1_uid22_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal yip1E_1_uid22_atan2Test_o : STD_LOGIC_VECTOR (12 downto 0);
    signal yip1E_1_uid22_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal cstArcTan2Mi_1_uid32_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2CostZeroPaddingA_uid41_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal cstArcTan2Mi_2_uid48_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_3_uid64_atan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_4CostZeroPaddingA_uid66_atan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal cstArcTan2Mi_4_uid80_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5CostZeroPaddingA_uid82_atan2Test_q : STD_LOGIC_VECTOR (3 downto 0);
    signal cstArcTan2Mi_5_uid98_atan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal cstArcTan2Mi_6_uid116_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal cstArcTan2Mi_7_uid130_atan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cstArcTan2Mi_8_uid144_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal cstArcTan2Mi_9_uid158_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_10_uid172_atan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal cstArcTan2Mi_11_uid186_atan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvMsbSel11_uid190_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel11_uid190_atan2Test_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel11_uid190_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroOutFormat_uid203_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal constPiP2uE_uid204_atan2Test_q : STD_LOGIC_VECTOR (11 downto 0);
    signal atanResPostExc_uid210_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid210_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal constPiP2u_uid212_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal constPi_uid213_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal constantZeroOutFormat_uid214_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal constantZeroOutFormatP2u_uid215_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (37 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist15_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist16_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist17_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist19_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist20_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist21_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist22_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist24_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist25_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist26_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist27_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist28_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist29_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist30_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist31_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist32_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist33_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_2NA_uid35_atan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_2NA_uid38_atan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal constPio2P2u_mergedSignalTM_uid207_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yNotZero_uid15_atan2Test_a : STD_LOGIC_VECTOR (11 downto 0);
    signal yNotZero_uid15_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZero_uid16_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal yZero_uid16_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_atan2Test_a : STD_LOGIC_VECTOR (11 downto 0);
    signal xNotZero_uid17_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xZero_uid18_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xZero_uid18_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alphaPostRndhigh_uid200_atan2Test_a : STD_LOGIC_VECTOR (12 downto 0);
    signal alphaPostRndhigh_uid200_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal alphaPostRndhigh_uid200_atan2Test_o : STD_LOGIC_VECTOR (12 downto 0);
    signal alphaPostRndhigh_uid200_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal firstOperand_uid216_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal firstOperand_uid216_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal secondOperand_uid217_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal secondOperand_uid217_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal outResExtended_uid218_atan2Test_a : STD_LOGIC_VECTOR (13 downto 0);
    signal outResExtended_uid218_atan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal outResExtended_uid218_atan2Test_o : STD_LOGIC_VECTOR (13 downto 0);
    signal outResExtended_uid218_atan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal signX_uid7_atan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal signX_uid7_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid8_atan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal signY_uid8_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal CstArcTan2Mi_020_uid26_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal CstArcTan2Mi_020_uid26_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Yip1_112_uid31_atan2Test_in : STD_LOGIC_VECTOR (12 downto 0);
    signal Yip1_112_uid31_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3NA_uid51_atan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1E_3NA_uid54_atan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_3NA_uid58_atan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_4NA_uid74_atan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_5NA_uid90_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_6NA_uid101_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6NA_uid104_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6NA_uid108_atan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_7NA_uid122_atan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_8NA_uid136_atan2Test_q : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_9NA_uid150_atan2Test_q : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_10NA_uid164_atan2Test_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_11NA_uid178_atan2Test_q : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_12NA_uid192_atan2Test_q : STD_LOGIC_VECTOR (43 downto 0);
    signal xip1E_4NA_uid67_atan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_4NA_uid70_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_5NA_uid83_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_5NA_uid86_atan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_a : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_b : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_o : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid193_atan2Test_q : STD_LOGIC_VECTOR (44 downto 0);
    signal alphaPostRnd_uid198_uid201_atan2Test_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Yip1_1016_uid169_atan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal Yip1_1016_uid169_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid175_atan2Test_a : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_11_uid175_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_11_uid175_atan2Test_o : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_11_uid175_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid175_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid175_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal Yip1_917_uid155_atan2Test_in : STD_LOGIC_VECTOR (17 downto 0);
    signal Yip1_917_uid155_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid157_atan2Test_in : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid157_atan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal twoToMiSiXip_uid156_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiXip_uid156_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal Yip1_818_uid141_atan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal Yip1_818_uid141_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid143_atan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid143_atan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal twoToMiSiXip_uid142_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiXip_uid142_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Yip1_719_uid127_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal Yip1_719_uid127_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid129_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid129_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal twoToMiSiXip_uid128_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiXip_uid128_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal Yip1_620_uid113_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal Yip1_620_uid113_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid115_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid115_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal twoToMiSiXip_uid114_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiXip_uid114_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal Yip1_519_uid95_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal Yip1_519_uid95_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiYip_uid97_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid97_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal twoToMiSiXip_uid96_atan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiXip_uid96_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal Yip1_416_uid79_atan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal Yip1_416_uid79_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid87_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal Yip1_314_uid63_atan2Test_in : STD_LOGIC_VECTOR (14 downto 0);
    signal Yip1_314_uid63_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_a : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_o : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid71_atan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal Yip1_213_uid47_atan2Test_in : STD_LOGIC_VECTOR (13 downto 0);
    signal Yip1_213_uid47_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_a : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_o : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid55_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid39_atan2Test_q : STD_LOGIC_VECTOR (14 downto 0);
    signal concXZeroYZero_uid209_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostRR_uid219_atan2Test_in : STD_LOGIC_VECTOR (13 downto 0);
    signal atanResPostRR_uid219_atan2Test_b : STD_LOGIC_VECTOR (11 downto 0);
    signal InvSignX_uid9_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvSignX_uid9_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concSigns_uid211_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal InvSignY_uid11_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvSignY_uid11_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_topExtension_uid27_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_topExtension_uid27_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_topExtension_uid27_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel1_uid33_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel1_uid33_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid105_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid196_atan2Test_in : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_uid196_atan2Test_b : STD_LOGIC_VECTOR (43 downto 0);
    signal atanRes_uid202_atan2Test_in : STD_LOGIC_VECTOR (12 downto 0);
    signal atanRes_uid202_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal InvMsbSel10_uid176_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel10_uid176_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_11_uid181_atan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1_11_uid181_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal InvMsbSel9_uid159_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel9_uid159_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid161_atan2Test_a : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_10_uid161_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_10_uid161_atan2Test_o : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_10_uid161_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid161_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid161_atan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_10_uid160_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_10_uid160_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_10_uid160_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_10_uid160_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid160_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid160_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal InvMsbSel8_uid145_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel8_uid145_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid147_atan2Test_a : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_9_uid147_atan2Test_b : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_9_uid147_atan2Test_o : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_9_uid147_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid147_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid147_atan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_9_uid146_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_9_uid146_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_9_uid146_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_9_uid146_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid146_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid146_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal InvMsbSel7_uid131_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel7_uid131_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid133_atan2Test_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_8_uid133_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_8_uid133_atan2Test_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_8_uid133_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid133_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid133_atan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_8_uid132_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_8_uid132_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_8_uid132_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_8_uid132_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid132_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid132_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal InvMsbSel6_uid117_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel6_uid117_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid119_atan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_7_uid119_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_7_uid119_atan2Test_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_7_uid119_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid119_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid119_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_7_uid118_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_7_uid118_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_7_uid118_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_7_uid118_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid118_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid118_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal InvMsbSel5_uid99_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel5_uid99_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid102_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal InvMsbSel4_uid81_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel4_uid81_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_5_uid93_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_5_uid93_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal InvMsbSel3_uid65_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel3_uid65_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_4_uid77_atan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1_4_uid77_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal InvMsbSel2_uid49_atan2Test_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMsbSel2_uid49_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_3_uid61_atan2Test_in : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1_3_uid61_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1_2_uid45_atan2Test_in : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1_2_uid45_atan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal absXE_uid10_atan2Test_a : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_atan2Test_o : STD_LOGIC_VECTOR (14 downto 0);
    signal absXE_uid10_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal absYE_uid12_atan2Test_a : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_atan2Test_o : STD_LOGIC_VECTOR (14 downto 0);
    signal absYE_uid12_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_atan2Test_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_mergedSignalTM_uid29_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_a : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_o : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid36_atan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1_6_uid111_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_6_uid111_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal alphaPreRnd_uid197_atan2Test_in : STD_LOGIC_VECTOR (43 downto 0);
    signal alphaPreRnd_uid197_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid179_atan2Test_q : STD_LOGIC_VECTOR (42 downto 0);
    signal Yip1_1115_uid183_atan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal Yip1_1115_uid183_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_a : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_b : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_o : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid165_atan2Test_q : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1_10_uid167_atan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1_10_uid167_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_10_uid166_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_10_uid166_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_a : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_b : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_o : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9sumAHighB_uid151_atan2Test_q : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_9_uid153_atan2Test_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_9_uid153_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_9_uid152_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_9_uid152_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_a : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_o : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8sumAHighB_uid137_atan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal yip1_8_uid139_atan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_8_uid139_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_8_uid138_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_8_uid138_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_a : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_b : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_o : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7sumAHighB_uid123_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1_7_uid125_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_7_uid125_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_7_uid124_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_7_uid124_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_a : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_o : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6sumAHighB_uid109_atan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_6_uid110_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_6_uid110_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid84_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_a : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_o : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5sumAHighB_uid91_atan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_a : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_o : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid68_atan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_a : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_o : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4sumAHighB_uid75_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_a : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_o : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid52_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3sumAHighB_uid59_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal absX_uid13_atan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal absX_uid13_atan2Test_b : STD_LOGIC_VECTOR (11 downto 0);
    signal absY_uid14_atan2Test_in : STD_LOGIC_VECTOR (11 downto 0);
    signal absY_uid14_atan2Test_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_2NA_uid42_atan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_2_uid44_atan2Test_in : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_2_uid44_atan2Test_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeA_uid198_atan2Test_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid198_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid199_atan2Test_in : STD_LOGIC_VECTOR (12 downto 0);
    signal highABits_uid199_atan2Test_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid182_atan2Test_in : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_uid182_atan2Test_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_uid168_atan2Test_in : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_uid168_atan2Test_b : STD_LOGIC_VECTOR (39 downto 0);
    signal twoToMiSiXip_uid170_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiXip_uid170_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid154_atan2Test_in : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_uid154_atan2Test_b : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_uid140_atan2Test_in : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_uid140_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_uid126_atan2Test_in : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_uid126_atan2Test_b : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_uid112_atan2Test_in : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_uid112_atan2Test_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_5_uid92_atan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid92_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid94_atan2Test_in : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_uid94_atan2Test_b : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_4_uid76_atan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_4_uid76_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid78_atan2Test_in : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid78_atan2Test_b : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_3_uid60_atan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_3_uid60_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid62_atan2Test_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_uid62_atan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2sumAHighB_uid43_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid46_atan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid46_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- constPi_uid213_atan2Test(CONSTANT,212)
    constPi_uid213_atan2Test_q <= "1100100100010";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- constPiP2uE_uid204_atan2Test(CONSTANT,203)
    constPiP2uE_uid204_atan2Test_q <= "110010010011";

    -- constPio2P2u_mergedSignalTM_uid207_atan2Test(BITJOIN,206)@13
    constPio2P2u_mergedSignalTM_uid207_atan2Test_q <= GND_q & constPiP2uE_uid204_atan2Test_q;

    -- cstZeroOutFormat_uid203_atan2Test(CONSTANT,202)
    cstZeroOutFormat_uid203_atan2Test_q <= "0000000000010";

    -- Yip1_1016_uid169_atan2Test(BITSELECT,168)@11
    Yip1_1016_uid169_atan2Test_in <= STD_LOGIC_VECTOR(redist7_q);
    Yip1_1016_uid169_atan2Test_b <= Yip1_1016_uid169_atan2Test_in(16 downto 16);

    -- Yip1_818_uid141_atan2Test(BITSELECT,140)@9
    Yip1_818_uid141_atan2Test_in <= STD_LOGIC_VECTOR(redist12_q);
    Yip1_818_uid141_atan2Test_b <= Yip1_818_uid141_atan2Test_in(18 downto 18);

    -- Yip1_620_uid113_atan2Test(BITSELECT,112)@7
    Yip1_620_uid113_atan2Test_in <= STD_LOGIC_VECTOR(redist18_q);
    Yip1_620_uid113_atan2Test_b <= Yip1_620_uid113_atan2Test_in(20 downto 20);

    -- signX_uid7_atan2Test(BITSELECT,6)@0
    signX_uid7_atan2Test_in <= STD_LOGIC_VECTOR(x);
    signX_uid7_atan2Test_b <= signX_uid7_atan2Test_in(11 downto 11);

    -- InvSignX_uid9_atan2Test(LOGICAL,8)@0
    InvSignX_uid9_atan2Test_a <= signX_uid7_atan2Test_b;
    InvSignX_uid9_atan2Test_q <= not (InvSignX_uid9_atan2Test_a);

    -- xIn(GPIN,3)@0

    -- constantZero_uid6_atan2Test(CONSTANT,5)
    constantZero_uid6_atan2Test_q <= "000000000000";

    -- absXE_uid10_atan2Test(ADDSUB,9)@0
    absXE_uid10_atan2Test_s <= InvSignX_uid9_atan2Test_q;
    absXE_uid10_atan2Test_cin <= GND_q;
    absXE_uid10_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => constantZero_uid6_atan2Test_q(11)) & constantZero_uid6_atan2Test_q) & InvSignX_uid9_atan2Test_q(0));
    absXE_uid10_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => x(11)) & x) & absXE_uid10_atan2Test_cin(0));
    absXE_uid10_atan2Test: PROCESS (absXE_uid10_atan2Test_a, absXE_uid10_atan2Test_b, absXE_uid10_atan2Test_s)
    BEGIN
        IF (absXE_uid10_atan2Test_s = "1") THEN
            absXE_uid10_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_atan2Test_a) + SIGNED(absXE_uid10_atan2Test_b));
        ELSE
            absXE_uid10_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_atan2Test_a) - SIGNED(absXE_uid10_atan2Test_b));
        END IF;
    END PROCESS;
    absXE_uid10_atan2Test_q <= absXE_uid10_atan2Test_o(13 downto 1);

    -- absX_uid13_atan2Test(BITSELECT,12)@0
    absX_uid13_atan2Test_in <= absXE_uid10_atan2Test_q(11 downto 0);
    absX_uid13_atan2Test_b <= absX_uid13_atan2Test_in(11 downto 0);

    -- redist33(DELAY,253)
    redist33 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => absX_uid13_atan2Test_b, xout => redist33_q, clk => clk, aclr => areset );

    -- signY_uid8_atan2Test(BITSELECT,7)@0
    signY_uid8_atan2Test_in <= STD_LOGIC_VECTOR(y);
    signY_uid8_atan2Test_b <= signY_uid8_atan2Test_in(11 downto 11);

    -- InvSignY_uid11_atan2Test(LOGICAL,10)@0
    InvSignY_uid11_atan2Test_a <= signY_uid8_atan2Test_b;
    InvSignY_uid11_atan2Test_q <= not (InvSignY_uid11_atan2Test_a);

    -- absYE_uid12_atan2Test(ADDSUB,11)@0
    absYE_uid12_atan2Test_s <= InvSignY_uid11_atan2Test_q;
    absYE_uid12_atan2Test_cin <= GND_q;
    absYE_uid12_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => constantZero_uid6_atan2Test_q(11)) & constantZero_uid6_atan2Test_q) & InvSignY_uid11_atan2Test_q(0));
    absYE_uid12_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => y(11)) & y) & absYE_uid12_atan2Test_cin(0));
    absYE_uid12_atan2Test: PROCESS (absYE_uid12_atan2Test_a, absYE_uid12_atan2Test_b, absYE_uid12_atan2Test_s)
    BEGIN
        IF (absYE_uid12_atan2Test_s = "1") THEN
            absYE_uid12_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_atan2Test_a) + SIGNED(absYE_uid12_atan2Test_b));
        ELSE
            absYE_uid12_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_atan2Test_a) - SIGNED(absYE_uid12_atan2Test_b));
        END IF;
    END PROCESS;
    absYE_uid12_atan2Test_q <= absYE_uid12_atan2Test_o(13 downto 1);

    -- absY_uid14_atan2Test(BITSELECT,13)@0
    absY_uid14_atan2Test_in <= absYE_uid12_atan2Test_q(11 downto 0);
    absY_uid14_atan2Test_b <= absY_uid14_atan2Test_in(11 downto 0);

    -- redist32(DELAY,252)
    redist32 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => absY_uid14_atan2Test_b, xout => redist32_q, clk => clk, aclr => areset );

    -- yip1E_1_uid22_atan2Test(SUB,21)@1
    yip1E_1_uid22_atan2Test_a <= STD_LOGIC_VECTOR("0" & redist32_q);
    yip1E_1_uid22_atan2Test_b <= STD_LOGIC_VECTOR("0" & redist33_q);
    yip1E_1_uid22_atan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1_uid22_atan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            yip1E_1_uid22_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1_uid22_atan2Test_a) - UNSIGNED(yip1E_1_uid22_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_1_uid22_atan2Test_q <= yip1E_1_uid22_atan2Test_o(12 downto 0);

    -- Yip1_112_uid31_atan2Test(BITSELECT,30)@2
    Yip1_112_uid31_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_1_uid22_atan2Test_q);
    Yip1_112_uid31_atan2Test_b <= Yip1_112_uid31_atan2Test_in(12 downto 12);

    -- xip1E_1_uid21_atan2Test(ADD,20)@1
    xip1E_1_uid21_atan2Test_a <= STD_LOGIC_VECTOR("0" & redist33_q);
    xip1E_1_uid21_atan2Test_b <= STD_LOGIC_VECTOR("0" & redist32_q);
    xip1E_1_uid21_atan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xip1E_1_uid21_atan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xip1E_1_uid21_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(xip1E_1_uid21_atan2Test_a) + UNSIGNED(xip1E_1_uid21_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_1_uid21_atan2Test_q <= xip1E_1_uid21_atan2Test_o(12 downto 0);

    -- yip1E_2NA_uid38_atan2Test(BITJOIN,37)@2
    yip1E_2NA_uid38_atan2Test_q <= yip1E_1_uid22_atan2Test_q & GND_q;

    -- yip1E_2sumAHighB_uid39_atan2Test(ADDSUB,38)@2
    yip1E_2sumAHighB_uid39_atan2Test_s <= Yip1_112_uid31_atan2Test_b;
    yip1E_2sumAHighB_uid39_atan2Test_cin <= GND_q;
    yip1E_2sumAHighB_uid39_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => yip1E_2NA_uid38_atan2Test_q(13)) & yip1E_2NA_uid38_atan2Test_q) & Yip1_112_uid31_atan2Test_b(0));
    yip1E_2sumAHighB_uid39_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_1_uid21_atan2Test_q) & yip1E_2sumAHighB_uid39_atan2Test_cin(0));
    yip1E_2sumAHighB_uid39_atan2Test: PROCESS (yip1E_2sumAHighB_uid39_atan2Test_a, yip1E_2sumAHighB_uid39_atan2Test_b, yip1E_2sumAHighB_uid39_atan2Test_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid39_atan2Test_s = "1") THEN
            yip1E_2sumAHighB_uid39_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid39_atan2Test_a) + SIGNED(yip1E_2sumAHighB_uid39_atan2Test_b));
        ELSE
            yip1E_2sumAHighB_uid39_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid39_atan2Test_a) - SIGNED(yip1E_2sumAHighB_uid39_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid39_atan2Test_q <= yip1E_2sumAHighB_uid39_atan2Test_o(15 downto 1);

    -- yip1_2_uid45_atan2Test(BITSELECT,44)@2
    yip1_2_uid45_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid39_atan2Test_q(13 downto 0));
    yip1_2_uid45_atan2Test_b <= yip1_2_uid45_atan2Test_in(13 downto 0);

    -- redist30(DELAY,250)
    redist30 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => yip1_2_uid45_atan2Test_b, xout => redist30_q, clk => clk, aclr => areset );

    -- Yip1_213_uid47_atan2Test(BITSELECT,46)@3
    Yip1_213_uid47_atan2Test_in <= STD_LOGIC_VECTOR(redist30_q);
    Yip1_213_uid47_atan2Test_b <= Yip1_213_uid47_atan2Test_in(13 downto 13);

    -- InvMsbSel1_uid33_atan2Test(LOGICAL,32)@2
    InvMsbSel1_uid33_atan2Test_a <= Yip1_112_uid31_atan2Test_b;
    InvMsbSel1_uid33_atan2Test_q <= not (InvMsbSel1_uid33_atan2Test_a);

    -- xip1E_2NA_uid35_atan2Test(BITJOIN,34)@2
    xip1E_2NA_uid35_atan2Test_q <= xip1E_1_uid21_atan2Test_q & GND_q;

    -- xip1E_2sumAHighB_uid36_atan2Test(ADDSUB,35)@2
    xip1E_2sumAHighB_uid36_atan2Test_s <= InvMsbSel1_uid33_atan2Test_q;
    xip1E_2sumAHighB_uid36_atan2Test_cin <= GND_q;
    xip1E_2sumAHighB_uid36_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_2NA_uid35_atan2Test_q) & InvMsbSel1_uid33_atan2Test_q(0));
    xip1E_2sumAHighB_uid36_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => yip1E_1_uid22_atan2Test_q(12)) & yip1E_1_uid22_atan2Test_q) & xip1E_2sumAHighB_uid36_atan2Test_cin(0));
    xip1E_2sumAHighB_uid36_atan2Test: PROCESS (xip1E_2sumAHighB_uid36_atan2Test_a, xip1E_2sumAHighB_uid36_atan2Test_b, xip1E_2sumAHighB_uid36_atan2Test_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid36_atan2Test_s = "1") THEN
            xip1E_2sumAHighB_uid36_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid36_atan2Test_a) + SIGNED(xip1E_2sumAHighB_uid36_atan2Test_b));
        ELSE
            xip1E_2sumAHighB_uid36_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid36_atan2Test_a) - SIGNED(xip1E_2sumAHighB_uid36_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid36_atan2Test_q <= xip1E_2sumAHighB_uid36_atan2Test_o(16 downto 1);

    -- xip1_2_uid44_atan2Test(BITSELECT,43)@2
    xip1_2_uid44_atan2Test_in <= xip1E_2sumAHighB_uid36_atan2Test_q(13 downto 0);
    xip1_2_uid44_atan2Test_b <= xip1_2_uid44_atan2Test_in(13 downto 0);

    -- redist31(DELAY,251)
    redist31 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => xip1_2_uid44_atan2Test_b, xout => redist31_q, clk => clk, aclr => areset );

    -- aip1E_2CostZeroPaddingA_uid41_atan2Test(CONSTANT,40)
    aip1E_2CostZeroPaddingA_uid41_atan2Test_q <= "00";

    -- yip1E_3NA_uid54_atan2Test(BITJOIN,53)@3
    yip1E_3NA_uid54_atan2Test_q <= redist30_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- yip1E_3sumAHighB_uid55_atan2Test(ADDSUB,54)@3
    yip1E_3sumAHighB_uid55_atan2Test_s <= Yip1_213_uid47_atan2Test_b;
    yip1E_3sumAHighB_uid55_atan2Test_cin <= GND_q;
    yip1E_3sumAHighB_uid55_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => yip1E_3NA_uid54_atan2Test_q(15)) & yip1E_3NA_uid54_atan2Test_q) & Yip1_213_uid47_atan2Test_b(0));
    yip1E_3sumAHighB_uid55_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & redist31_q) & yip1E_3sumAHighB_uid55_atan2Test_cin(0));
    yip1E_3sumAHighB_uid55_atan2Test: PROCESS (yip1E_3sumAHighB_uid55_atan2Test_a, yip1E_3sumAHighB_uid55_atan2Test_b, yip1E_3sumAHighB_uid55_atan2Test_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid55_atan2Test_s = "1") THEN
            yip1E_3sumAHighB_uid55_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid55_atan2Test_a) + SIGNED(yip1E_3sumAHighB_uid55_atan2Test_b));
        ELSE
            yip1E_3sumAHighB_uid55_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid55_atan2Test_a) - SIGNED(yip1E_3sumAHighB_uid55_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid55_atan2Test_q <= yip1E_3sumAHighB_uid55_atan2Test_o(17 downto 1);

    -- yip1_3_uid61_atan2Test(BITSELECT,60)@3
    yip1_3_uid61_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid55_atan2Test_q(14 downto 0));
    yip1_3_uid61_atan2Test_b <= yip1_3_uid61_atan2Test_in(14 downto 0);

    -- redist27(DELAY,247)
    redist27 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => yip1_3_uid61_atan2Test_b, xout => redist27_q, clk => clk, aclr => areset );

    -- Yip1_314_uid63_atan2Test(BITSELECT,62)@4
    Yip1_314_uid63_atan2Test_in <= STD_LOGIC_VECTOR(redist27_q);
    Yip1_314_uid63_atan2Test_b <= Yip1_314_uid63_atan2Test_in(14 downto 14);

    -- InvMsbSel2_uid49_atan2Test(LOGICAL,48)@3
    InvMsbSel2_uid49_atan2Test_a <= Yip1_213_uid47_atan2Test_b;
    InvMsbSel2_uid49_atan2Test_q <= not (InvMsbSel2_uid49_atan2Test_a);

    -- xip1E_3NA_uid51_atan2Test(BITJOIN,50)@3
    xip1E_3NA_uid51_atan2Test_q <= redist31_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- xip1E_3sumAHighB_uid52_atan2Test(ADDSUB,51)@3
    xip1E_3sumAHighB_uid52_atan2Test_s <= InvMsbSel2_uid49_atan2Test_q;
    xip1E_3sumAHighB_uid52_atan2Test_cin <= GND_q;
    xip1E_3sumAHighB_uid52_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_3NA_uid51_atan2Test_q) & InvMsbSel2_uid49_atan2Test_q(0));
    xip1E_3sumAHighB_uid52_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 14 => redist30_q(13)) & redist30_q) & xip1E_3sumAHighB_uid52_atan2Test_cin(0));
    xip1E_3sumAHighB_uid52_atan2Test: PROCESS (xip1E_3sumAHighB_uid52_atan2Test_a, xip1E_3sumAHighB_uid52_atan2Test_b, xip1E_3sumAHighB_uid52_atan2Test_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid52_atan2Test_s = "1") THEN
            xip1E_3sumAHighB_uid52_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid52_atan2Test_a) + SIGNED(xip1E_3sumAHighB_uid52_atan2Test_b));
        ELSE
            xip1E_3sumAHighB_uid52_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid52_atan2Test_a) - SIGNED(xip1E_3sumAHighB_uid52_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid52_atan2Test_q <= xip1E_3sumAHighB_uid52_atan2Test_o(18 downto 1);

    -- xip1_3_uid60_atan2Test(BITSELECT,59)@3
    xip1_3_uid60_atan2Test_in <= xip1E_3sumAHighB_uid52_atan2Test_q(15 downto 0);
    xip1_3_uid60_atan2Test_b <= xip1_3_uid60_atan2Test_in(15 downto 0);

    -- redist28(DELAY,248)
    redist28 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xip1_3_uid60_atan2Test_b, xout => redist28_q, clk => clk, aclr => areset );

    -- xip1E_4CostZeroPaddingA_uid66_atan2Test(CONSTANT,65)
    xip1E_4CostZeroPaddingA_uid66_atan2Test_q <= "000";

    -- yip1E_4NA_uid70_atan2Test(BITJOIN,69)@4
    yip1E_4NA_uid70_atan2Test_q <= redist27_q & xip1E_4CostZeroPaddingA_uid66_atan2Test_q;

    -- yip1E_4sumAHighB_uid71_atan2Test(ADDSUB,70)@4
    yip1E_4sumAHighB_uid71_atan2Test_s <= Yip1_314_uid63_atan2Test_b;
    yip1E_4sumAHighB_uid71_atan2Test_cin <= GND_q;
    yip1E_4sumAHighB_uid71_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yip1E_4NA_uid70_atan2Test_q(17)) & yip1E_4NA_uid70_atan2Test_q) & Yip1_314_uid63_atan2Test_b(0));
    yip1E_4sumAHighB_uid71_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & redist28_q) & yip1E_4sumAHighB_uid71_atan2Test_cin(0));
    yip1E_4sumAHighB_uid71_atan2Test: PROCESS (yip1E_4sumAHighB_uid71_atan2Test_a, yip1E_4sumAHighB_uid71_atan2Test_b, yip1E_4sumAHighB_uid71_atan2Test_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid71_atan2Test_s = "1") THEN
            yip1E_4sumAHighB_uid71_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid71_atan2Test_a) + SIGNED(yip1E_4sumAHighB_uid71_atan2Test_b));
        ELSE
            yip1E_4sumAHighB_uid71_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid71_atan2Test_a) - SIGNED(yip1E_4sumAHighB_uid71_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid71_atan2Test_q <= yip1E_4sumAHighB_uid71_atan2Test_o(19 downto 1);

    -- yip1_4_uid77_atan2Test(BITSELECT,76)@4
    yip1_4_uid77_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid71_atan2Test_q(16 downto 0));
    yip1_4_uid77_atan2Test_b <= yip1_4_uid77_atan2Test_in(16 downto 0);

    -- redist24(DELAY,244)
    redist24 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => yip1_4_uid77_atan2Test_b, xout => redist24_q, clk => clk, aclr => areset );

    -- Yip1_416_uid79_atan2Test(BITSELECT,78)@5
    Yip1_416_uid79_atan2Test_in <= STD_LOGIC_VECTOR(redist24_q);
    Yip1_416_uid79_atan2Test_b <= Yip1_416_uid79_atan2Test_in(16 downto 16);

    -- InvMsbSel3_uid65_atan2Test(LOGICAL,64)@4
    InvMsbSel3_uid65_atan2Test_a <= Yip1_314_uid63_atan2Test_b;
    InvMsbSel3_uid65_atan2Test_q <= not (InvMsbSel3_uid65_atan2Test_a);

    -- xip1E_4NA_uid67_atan2Test(BITJOIN,66)@4
    xip1E_4NA_uid67_atan2Test_q <= redist28_q & xip1E_4CostZeroPaddingA_uid66_atan2Test_q;

    -- xip1E_4sumAHighB_uid68_atan2Test(ADDSUB,67)@4
    xip1E_4sumAHighB_uid68_atan2Test_s <= InvMsbSel3_uid65_atan2Test_q;
    xip1E_4sumAHighB_uid68_atan2Test_cin <= GND_q;
    xip1E_4sumAHighB_uid68_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_4NA_uid67_atan2Test_q) & InvMsbSel3_uid65_atan2Test_q(0));
    xip1E_4sumAHighB_uid68_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 15 => redist27_q(14)) & redist27_q) & xip1E_4sumAHighB_uid68_atan2Test_cin(0));
    xip1E_4sumAHighB_uid68_atan2Test: PROCESS (xip1E_4sumAHighB_uid68_atan2Test_a, xip1E_4sumAHighB_uid68_atan2Test_b, xip1E_4sumAHighB_uid68_atan2Test_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid68_atan2Test_s = "1") THEN
            xip1E_4sumAHighB_uid68_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid68_atan2Test_a) + SIGNED(xip1E_4sumAHighB_uid68_atan2Test_b));
        ELSE
            xip1E_4sumAHighB_uid68_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid68_atan2Test_a) - SIGNED(xip1E_4sumAHighB_uid68_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid68_atan2Test_q <= xip1E_4sumAHighB_uid68_atan2Test_o(21 downto 1);

    -- xip1_4_uid76_atan2Test(BITSELECT,75)@4
    xip1_4_uid76_atan2Test_in <= xip1E_4sumAHighB_uid68_atan2Test_q(18 downto 0);
    xip1_4_uid76_atan2Test_b <= xip1_4_uid76_atan2Test_in(18 downto 0);

    -- redist25(DELAY,245)
    redist25 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => xip1_4_uid76_atan2Test_b, xout => redist25_q, clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid82_atan2Test(CONSTANT,81)
    xip1E_5CostZeroPaddingA_uid82_atan2Test_q <= "0000";

    -- yip1E_5NA_uid86_atan2Test(BITJOIN,85)@5
    yip1E_5NA_uid86_atan2Test_q <= redist24_q & xip1E_5CostZeroPaddingA_uid82_atan2Test_q;

    -- yip1E_5sumAHighB_uid87_atan2Test(ADDSUB,86)@5
    yip1E_5sumAHighB_uid87_atan2Test_s <= Yip1_416_uid79_atan2Test_b;
    yip1E_5sumAHighB_uid87_atan2Test_cin <= GND_q;
    yip1E_5sumAHighB_uid87_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => yip1E_5NA_uid86_atan2Test_q(20)) & yip1E_5NA_uid86_atan2Test_q) & Yip1_416_uid79_atan2Test_b(0));
    yip1E_5sumAHighB_uid87_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & redist25_q) & yip1E_5sumAHighB_uid87_atan2Test_cin(0));
    yip1E_5sumAHighB_uid87_atan2Test: PROCESS (yip1E_5sumAHighB_uid87_atan2Test_a, yip1E_5sumAHighB_uid87_atan2Test_b, yip1E_5sumAHighB_uid87_atan2Test_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid87_atan2Test_s = "1") THEN
            yip1E_5sumAHighB_uid87_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid87_atan2Test_a) + SIGNED(yip1E_5sumAHighB_uid87_atan2Test_b));
        ELSE
            yip1E_5sumAHighB_uid87_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid87_atan2Test_a) - SIGNED(yip1E_5sumAHighB_uid87_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid87_atan2Test_q <= yip1E_5sumAHighB_uid87_atan2Test_o(22 downto 1);

    -- yip1_5_uid93_atan2Test(BITSELECT,92)@5
    yip1_5_uid93_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid87_atan2Test_q(19 downto 0));
    yip1_5_uid93_atan2Test_b <= yip1_5_uid93_atan2Test_in(19 downto 0);

    -- redist21(DELAY,241)
    redist21 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => yip1_5_uid93_atan2Test_b, xout => redist21_q, clk => clk, aclr => areset );

    -- Yip1_519_uid95_atan2Test(BITSELECT,94)@6
    Yip1_519_uid95_atan2Test_in <= STD_LOGIC_VECTOR(redist21_q);
    Yip1_519_uid95_atan2Test_b <= Yip1_519_uid95_atan2Test_in(19 downto 19);

    -- InvMsbSel5_uid99_atan2Test(LOGICAL,98)@6
    InvMsbSel5_uid99_atan2Test_a <= Yip1_519_uid95_atan2Test_b;
    InvMsbSel5_uid99_atan2Test_q <= not (InvMsbSel5_uid99_atan2Test_a);

    -- twoToMiSiYip_uid97_atan2Test(BITSELECT,96)@6
    twoToMiSiYip_uid97_atan2Test_in <= STD_LOGIC_VECTOR(redist21_q);
    twoToMiSiYip_uid97_atan2Test_b <= twoToMiSiYip_uid97_atan2Test_in(19 downto 3);

    -- InvMsbSel4_uid81_atan2Test(LOGICAL,80)@5
    InvMsbSel4_uid81_atan2Test_a <= Yip1_416_uid79_atan2Test_b;
    InvMsbSel4_uid81_atan2Test_q <= not (InvMsbSel4_uid81_atan2Test_a);

    -- xip1E_5NA_uid83_atan2Test(BITJOIN,82)@5
    xip1E_5NA_uid83_atan2Test_q <= redist25_q & xip1E_5CostZeroPaddingA_uid82_atan2Test_q;

    -- xip1E_5sumAHighB_uid84_atan2Test(ADDSUB,83)@5
    xip1E_5sumAHighB_uid84_atan2Test_s <= InvMsbSel4_uid81_atan2Test_q;
    xip1E_5sumAHighB_uid84_atan2Test_cin <= GND_q;
    xip1E_5sumAHighB_uid84_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_5NA_uid83_atan2Test_q) & InvMsbSel4_uid81_atan2Test_q(0));
    xip1E_5sumAHighB_uid84_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 17 => redist24_q(16)) & redist24_q) & xip1E_5sumAHighB_uid84_atan2Test_cin(0));
    xip1E_5sumAHighB_uid84_atan2Test: PROCESS (xip1E_5sumAHighB_uid84_atan2Test_a, xip1E_5sumAHighB_uid84_atan2Test_b, xip1E_5sumAHighB_uid84_atan2Test_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid84_atan2Test_s = "1") THEN
            xip1E_5sumAHighB_uid84_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid84_atan2Test_a) + SIGNED(xip1E_5sumAHighB_uid84_atan2Test_b));
        ELSE
            xip1E_5sumAHighB_uid84_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid84_atan2Test_a) - SIGNED(xip1E_5sumAHighB_uid84_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid84_atan2Test_q <= xip1E_5sumAHighB_uid84_atan2Test_o(25 downto 1);

    -- xip1_5_uid92_atan2Test(BITSELECT,91)@5
    xip1_5_uid92_atan2Test_in <= xip1E_5sumAHighB_uid84_atan2Test_q(22 downto 0);
    xip1_5_uid92_atan2Test_b <= xip1_5_uid92_atan2Test_in(22 downto 0);

    -- redist22(DELAY,242)
    redist22 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => xip1_5_uid92_atan2Test_b, xout => redist22_q, clk => clk, aclr => areset );

    -- xip1E_6NA_uid101_atan2Test(BITJOIN,100)@6
    xip1E_6NA_uid101_atan2Test_q <= redist22_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- xip1E_6sumAHighB_uid102_atan2Test(ADDSUB,101)@6
    xip1E_6sumAHighB_uid102_atan2Test_s <= InvMsbSel5_uid99_atan2Test_q;
    xip1E_6sumAHighB_uid102_atan2Test_cin <= GND_q;
    xip1E_6sumAHighB_uid102_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & xip1E_6NA_uid101_atan2Test_q) & InvMsbSel5_uid99_atan2Test_q(0));
    xip1E_6sumAHighB_uid102_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 17 => twoToMiSiYip_uid97_atan2Test_b(16)) & twoToMiSiYip_uid97_atan2Test_b) & xip1E_6sumAHighB_uid102_atan2Test_cin(0));
    xip1E_6sumAHighB_uid102_atan2Test: PROCESS (xip1E_6sumAHighB_uid102_atan2Test_a, xip1E_6sumAHighB_uid102_atan2Test_b, xip1E_6sumAHighB_uid102_atan2Test_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid102_atan2Test_s = "1") THEN
            xip1E_6sumAHighB_uid102_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid102_atan2Test_a) + SIGNED(xip1E_6sumAHighB_uid102_atan2Test_b));
        ELSE
            xip1E_6sumAHighB_uid102_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid102_atan2Test_a) - SIGNED(xip1E_6sumAHighB_uid102_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid102_atan2Test_q <= xip1E_6sumAHighB_uid102_atan2Test_o(27 downto 1);

    -- xip1_6_uid110_atan2Test(BITSELECT,109)@6
    xip1_6_uid110_atan2Test_in <= xip1E_6sumAHighB_uid102_atan2Test_q(24 downto 0);
    xip1_6_uid110_atan2Test_b <= xip1_6_uid110_atan2Test_in(24 downto 0);

    -- redist19(DELAY,239)
    redist19 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => xip1_6_uid110_atan2Test_b, xout => redist19_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid114_atan2Test(BITSELECT,113)@7
    twoToMiSiXip_uid114_atan2Test_in <= redist19_q;
    twoToMiSiXip_uid114_atan2Test_b <= twoToMiSiXip_uid114_atan2Test_in(24 downto 6);

    -- twoToMiSiXip_uid96_atan2Test(BITSELECT,95)@6
    twoToMiSiXip_uid96_atan2Test_in <= redist22_q;
    twoToMiSiXip_uid96_atan2Test_b <= twoToMiSiXip_uid96_atan2Test_in(22 downto 3);

    -- yip1E_6NA_uid104_atan2Test(BITJOIN,103)@6
    yip1E_6NA_uid104_atan2Test_q <= redist21_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- yip1E_6sumAHighB_uid105_atan2Test(ADDSUB,104)@6
    yip1E_6sumAHighB_uid105_atan2Test_s <= Yip1_519_uid95_atan2Test_b;
    yip1E_6sumAHighB_uid105_atan2Test_cin <= GND_q;
    yip1E_6sumAHighB_uid105_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => yip1E_6NA_uid104_atan2Test_q(21)) & yip1E_6NA_uid104_atan2Test_q) & Yip1_519_uid95_atan2Test_b(0));
    yip1E_6sumAHighB_uid105_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & twoToMiSiXip_uid96_atan2Test_b) & yip1E_6sumAHighB_uid105_atan2Test_cin(0));
    yip1E_6sumAHighB_uid105_atan2Test: PROCESS (yip1E_6sumAHighB_uid105_atan2Test_a, yip1E_6sumAHighB_uid105_atan2Test_b, yip1E_6sumAHighB_uid105_atan2Test_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid105_atan2Test_s = "1") THEN
            yip1E_6sumAHighB_uid105_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid105_atan2Test_a) + SIGNED(yip1E_6sumAHighB_uid105_atan2Test_b));
        ELSE
            yip1E_6sumAHighB_uid105_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid105_atan2Test_a) - SIGNED(yip1E_6sumAHighB_uid105_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid105_atan2Test_q <= yip1E_6sumAHighB_uid105_atan2Test_o(23 downto 1);

    -- yip1_6_uid111_atan2Test(BITSELECT,110)@6
    yip1_6_uid111_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid105_atan2Test_q(20 downto 0));
    yip1_6_uid111_atan2Test_b <= yip1_6_uid111_atan2Test_in(20 downto 0);

    -- redist18(DELAY,238)
    redist18 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => yip1_6_uid111_atan2Test_b, xout => redist18_q, clk => clk, aclr => areset );

    -- yip1E_7_uid119_atan2Test(ADDSUB,118)@7
    yip1E_7_uid119_atan2Test_s <= Yip1_620_uid113_atan2Test_b;
    yip1E_7_uid119_atan2Test_cin <= GND_q;
    yip1E_7_uid119_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => redist18_q(20)) & redist18_q) & Yip1_620_uid113_atan2Test_b(0));
    yip1E_7_uid119_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & twoToMiSiXip_uid114_atan2Test_b) & yip1E_7_uid119_atan2Test_cin(0));
    yip1E_7_uid119_atan2Test: PROCESS (yip1E_7_uid119_atan2Test_a, yip1E_7_uid119_atan2Test_b, yip1E_7_uid119_atan2Test_s)
    BEGIN
        IF (yip1E_7_uid119_atan2Test_s = "1") THEN
            yip1E_7_uid119_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid119_atan2Test_a) + SIGNED(yip1E_7_uid119_atan2Test_b));
        ELSE
            yip1E_7_uid119_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid119_atan2Test_a) - SIGNED(yip1E_7_uid119_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_7_uid119_atan2Test_q <= yip1E_7_uid119_atan2Test_o(22 downto 1);

    -- yip1_7_uid125_atan2Test(BITSELECT,124)@7
    yip1_7_uid125_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_7_uid119_atan2Test_q(19 downto 0));
    yip1_7_uid125_atan2Test_b <= yip1_7_uid125_atan2Test_in(19 downto 0);

    -- redist15(DELAY,235)
    redist15 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => yip1_7_uid125_atan2Test_b, xout => redist15_q, clk => clk, aclr => areset );

    -- Yip1_719_uid127_atan2Test(BITSELECT,126)@8
    Yip1_719_uid127_atan2Test_in <= STD_LOGIC_VECTOR(redist15_q);
    Yip1_719_uid127_atan2Test_b <= Yip1_719_uid127_atan2Test_in(19 downto 19);

    -- InvMsbSel7_uid131_atan2Test(LOGICAL,130)@8
    InvMsbSel7_uid131_atan2Test_a <= Yip1_719_uid127_atan2Test_b;
    InvMsbSel7_uid131_atan2Test_q <= not (InvMsbSel7_uid131_atan2Test_a);

    -- twoToMiSiYip_uid129_atan2Test(BITSELECT,128)@8
    twoToMiSiYip_uid129_atan2Test_in <= STD_LOGIC_VECTOR(redist15_q);
    twoToMiSiYip_uid129_atan2Test_b <= twoToMiSiYip_uid129_atan2Test_in(19 downto 7);

    -- InvMsbSel6_uid117_atan2Test(LOGICAL,116)@7
    InvMsbSel6_uid117_atan2Test_a <= Yip1_620_uid113_atan2Test_b;
    InvMsbSel6_uid117_atan2Test_q <= not (InvMsbSel6_uid117_atan2Test_a);

    -- twoToMiSiYip_uid115_atan2Test(BITSELECT,114)@7
    twoToMiSiYip_uid115_atan2Test_in <= STD_LOGIC_VECTOR(redist18_q);
    twoToMiSiYip_uid115_atan2Test_b <= twoToMiSiYip_uid115_atan2Test_in(20 downto 6);

    -- xip1E_7_uid118_atan2Test(ADDSUB,117)@7
    xip1E_7_uid118_atan2Test_s <= InvMsbSel6_uid117_atan2Test_q;
    xip1E_7_uid118_atan2Test_cin <= GND_q;
    xip1E_7_uid118_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & redist19_q) & InvMsbSel6_uid117_atan2Test_q(0));
    xip1E_7_uid118_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 15 => twoToMiSiYip_uid115_atan2Test_b(14)) & twoToMiSiYip_uid115_atan2Test_b) & xip1E_7_uid118_atan2Test_cin(0));
    xip1E_7_uid118_atan2Test: PROCESS (xip1E_7_uid118_atan2Test_a, xip1E_7_uid118_atan2Test_b, xip1E_7_uid118_atan2Test_s)
    BEGIN
        IF (xip1E_7_uid118_atan2Test_s = "1") THEN
            xip1E_7_uid118_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid118_atan2Test_a) + SIGNED(xip1E_7_uid118_atan2Test_b));
        ELSE
            xip1E_7_uid118_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid118_atan2Test_a) - SIGNED(xip1E_7_uid118_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_7_uid118_atan2Test_q <= xip1E_7_uid118_atan2Test_o(27 downto 1);

    -- xip1_7_uid124_atan2Test(BITSELECT,123)@7
    xip1_7_uid124_atan2Test_in <= xip1E_7_uid118_atan2Test_q(24 downto 0);
    xip1_7_uid124_atan2Test_b <= xip1_7_uid124_atan2Test_in(24 downto 0);

    -- redist16(DELAY,236)
    redist16 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => xip1_7_uid124_atan2Test_b, xout => redist16_q, clk => clk, aclr => areset );

    -- xip1E_8_uid132_atan2Test(ADDSUB,131)@8
    xip1E_8_uid132_atan2Test_s <= InvMsbSel7_uid131_atan2Test_q;
    xip1E_8_uid132_atan2Test_cin <= GND_q;
    xip1E_8_uid132_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & redist16_q) & InvMsbSel7_uid131_atan2Test_q(0));
    xip1E_8_uid132_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 13 => twoToMiSiYip_uid129_atan2Test_b(12)) & twoToMiSiYip_uid129_atan2Test_b) & xip1E_8_uid132_atan2Test_cin(0));
    xip1E_8_uid132_atan2Test: PROCESS (xip1E_8_uid132_atan2Test_a, xip1E_8_uid132_atan2Test_b, xip1E_8_uid132_atan2Test_s)
    BEGIN
        IF (xip1E_8_uid132_atan2Test_s = "1") THEN
            xip1E_8_uid132_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid132_atan2Test_a) + SIGNED(xip1E_8_uid132_atan2Test_b));
        ELSE
            xip1E_8_uid132_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid132_atan2Test_a) - SIGNED(xip1E_8_uid132_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_8_uid132_atan2Test_q <= xip1E_8_uid132_atan2Test_o(27 downto 1);

    -- xip1_8_uid138_atan2Test(BITSELECT,137)@8
    xip1_8_uid138_atan2Test_in <= xip1E_8_uid132_atan2Test_q(24 downto 0);
    xip1_8_uid138_atan2Test_b <= xip1_8_uid138_atan2Test_in(24 downto 0);

    -- redist13(DELAY,233)
    redist13 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => xip1_8_uid138_atan2Test_b, xout => redist13_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid142_atan2Test(BITSELECT,141)@9
    twoToMiSiXip_uid142_atan2Test_in <= redist13_q;
    twoToMiSiXip_uid142_atan2Test_b <= twoToMiSiXip_uid142_atan2Test_in(24 downto 8);

    -- twoToMiSiXip_uid128_atan2Test(BITSELECT,127)@8
    twoToMiSiXip_uid128_atan2Test_in <= redist16_q;
    twoToMiSiXip_uid128_atan2Test_b <= twoToMiSiXip_uid128_atan2Test_in(24 downto 7);

    -- yip1E_8_uid133_atan2Test(ADDSUB,132)@8
    yip1E_8_uid133_atan2Test_s <= Yip1_719_uid127_atan2Test_b;
    yip1E_8_uid133_atan2Test_cin <= GND_q;
    yip1E_8_uid133_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist15_q(19)) & redist15_q) & Yip1_719_uid127_atan2Test_b(0));
    yip1E_8_uid133_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & twoToMiSiXip_uid128_atan2Test_b) & yip1E_8_uid133_atan2Test_cin(0));
    yip1E_8_uid133_atan2Test: PROCESS (yip1E_8_uid133_atan2Test_a, yip1E_8_uid133_atan2Test_b, yip1E_8_uid133_atan2Test_s)
    BEGIN
        IF (yip1E_8_uid133_atan2Test_s = "1") THEN
            yip1E_8_uid133_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid133_atan2Test_a) + SIGNED(yip1E_8_uid133_atan2Test_b));
        ELSE
            yip1E_8_uid133_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid133_atan2Test_a) - SIGNED(yip1E_8_uid133_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_8_uid133_atan2Test_q <= yip1E_8_uid133_atan2Test_o(21 downto 1);

    -- yip1_8_uid139_atan2Test(BITSELECT,138)@8
    yip1_8_uid139_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_8_uid133_atan2Test_q(18 downto 0));
    yip1_8_uid139_atan2Test_b <= yip1_8_uid139_atan2Test_in(18 downto 0);

    -- redist12(DELAY,232)
    redist12 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => yip1_8_uid139_atan2Test_b, xout => redist12_q, clk => clk, aclr => areset );

    -- yip1E_9_uid147_atan2Test(ADDSUB,146)@9
    yip1E_9_uid147_atan2Test_s <= Yip1_818_uid141_atan2Test_b;
    yip1E_9_uid147_atan2Test_cin <= GND_q;
    yip1E_9_uid147_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => redist12_q(18)) & redist12_q) & Yip1_818_uid141_atan2Test_b(0));
    yip1E_9_uid147_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & twoToMiSiXip_uid142_atan2Test_b) & yip1E_9_uid147_atan2Test_cin(0));
    yip1E_9_uid147_atan2Test: PROCESS (yip1E_9_uid147_atan2Test_a, yip1E_9_uid147_atan2Test_b, yip1E_9_uid147_atan2Test_s)
    BEGIN
        IF (yip1E_9_uid147_atan2Test_s = "1") THEN
            yip1E_9_uid147_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid147_atan2Test_a) + SIGNED(yip1E_9_uid147_atan2Test_b));
        ELSE
            yip1E_9_uid147_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid147_atan2Test_a) - SIGNED(yip1E_9_uid147_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_9_uid147_atan2Test_q <= yip1E_9_uid147_atan2Test_o(20 downto 1);

    -- yip1_9_uid153_atan2Test(BITSELECT,152)@9
    yip1_9_uid153_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_9_uid147_atan2Test_q(17 downto 0));
    yip1_9_uid153_atan2Test_b <= yip1_9_uid153_atan2Test_in(17 downto 0);

    -- redist9(DELAY,229)
    redist9 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => yip1_9_uid153_atan2Test_b, xout => redist9_q, clk => clk, aclr => areset );

    -- Yip1_917_uid155_atan2Test(BITSELECT,154)@10
    Yip1_917_uid155_atan2Test_in <= STD_LOGIC_VECTOR(redist9_q);
    Yip1_917_uid155_atan2Test_b <= Yip1_917_uid155_atan2Test_in(17 downto 17);

    -- InvMsbSel9_uid159_atan2Test(LOGICAL,158)@10
    InvMsbSel9_uid159_atan2Test_a <= Yip1_917_uid155_atan2Test_b;
    InvMsbSel9_uid159_atan2Test_q <= not (InvMsbSel9_uid159_atan2Test_a);

    -- twoToMiSiYip_uid157_atan2Test(BITSELECT,156)@10
    twoToMiSiYip_uid157_atan2Test_in <= STD_LOGIC_VECTOR(redist9_q);
    twoToMiSiYip_uid157_atan2Test_b <= twoToMiSiYip_uid157_atan2Test_in(17 downto 9);

    -- InvMsbSel8_uid145_atan2Test(LOGICAL,144)@9
    InvMsbSel8_uid145_atan2Test_a <= Yip1_818_uid141_atan2Test_b;
    InvMsbSel8_uid145_atan2Test_q <= not (InvMsbSel8_uid145_atan2Test_a);

    -- twoToMiSiYip_uid143_atan2Test(BITSELECT,142)@9
    twoToMiSiYip_uid143_atan2Test_in <= STD_LOGIC_VECTOR(redist12_q);
    twoToMiSiYip_uid143_atan2Test_b <= twoToMiSiYip_uid143_atan2Test_in(18 downto 8);

    -- xip1E_9_uid146_atan2Test(ADDSUB,145)@9
    xip1E_9_uid146_atan2Test_s <= InvMsbSel8_uid145_atan2Test_q;
    xip1E_9_uid146_atan2Test_cin <= GND_q;
    xip1E_9_uid146_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & redist13_q) & InvMsbSel8_uid145_atan2Test_q(0));
    xip1E_9_uid146_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 11 => twoToMiSiYip_uid143_atan2Test_b(10)) & twoToMiSiYip_uid143_atan2Test_b) & xip1E_9_uid146_atan2Test_cin(0));
    xip1E_9_uid146_atan2Test: PROCESS (xip1E_9_uid146_atan2Test_a, xip1E_9_uid146_atan2Test_b, xip1E_9_uid146_atan2Test_s)
    BEGIN
        IF (xip1E_9_uid146_atan2Test_s = "1") THEN
            xip1E_9_uid146_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid146_atan2Test_a) + SIGNED(xip1E_9_uid146_atan2Test_b));
        ELSE
            xip1E_9_uid146_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid146_atan2Test_a) - SIGNED(xip1E_9_uid146_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_9_uid146_atan2Test_q <= xip1E_9_uid146_atan2Test_o(27 downto 1);

    -- xip1_9_uid152_atan2Test(BITSELECT,151)@9
    xip1_9_uid152_atan2Test_in <= xip1E_9_uid146_atan2Test_q(24 downto 0);
    xip1_9_uid152_atan2Test_b <= xip1_9_uid152_atan2Test_in(24 downto 0);

    -- redist10(DELAY,230)
    redist10 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => xip1_9_uid152_atan2Test_b, xout => redist10_q, clk => clk, aclr => areset );

    -- xip1E_10_uid160_atan2Test(ADDSUB,159)@10
    xip1E_10_uid160_atan2Test_s <= InvMsbSel9_uid159_atan2Test_q;
    xip1E_10_uid160_atan2Test_cin <= GND_q;
    xip1E_10_uid160_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & redist10_q) & InvMsbSel9_uid159_atan2Test_q(0));
    xip1E_10_uid160_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 9 => twoToMiSiYip_uid157_atan2Test_b(8)) & twoToMiSiYip_uid157_atan2Test_b) & xip1E_10_uid160_atan2Test_cin(0));
    xip1E_10_uid160_atan2Test: PROCESS (xip1E_10_uid160_atan2Test_a, xip1E_10_uid160_atan2Test_b, xip1E_10_uid160_atan2Test_s)
    BEGIN
        IF (xip1E_10_uid160_atan2Test_s = "1") THEN
            xip1E_10_uid160_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid160_atan2Test_a) + SIGNED(xip1E_10_uid160_atan2Test_b));
        ELSE
            xip1E_10_uid160_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid160_atan2Test_a) - SIGNED(xip1E_10_uid160_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_10_uid160_atan2Test_q <= xip1E_10_uid160_atan2Test_o(27 downto 1);

    -- xip1_10_uid166_atan2Test(BITSELECT,165)@10
    xip1_10_uid166_atan2Test_in <= xip1E_10_uid160_atan2Test_q(24 downto 0);
    xip1_10_uid166_atan2Test_b <= xip1_10_uid166_atan2Test_in(24 downto 0);

    -- twoToMiSiXip_uid170_atan2Test(BITSELECT,169)@10
    twoToMiSiXip_uid170_atan2Test_in <= xip1_10_uid166_atan2Test_b;
    twoToMiSiXip_uid170_atan2Test_b <= twoToMiSiXip_uid170_atan2Test_in(24 downto 10);

    -- redist5(DELAY,225)
    redist5 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => twoToMiSiXip_uid170_atan2Test_b, xout => redist5_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid156_atan2Test(BITSELECT,155)@10
    twoToMiSiXip_uid156_atan2Test_in <= redist10_q;
    twoToMiSiXip_uid156_atan2Test_b <= twoToMiSiXip_uid156_atan2Test_in(24 downto 9);

    -- yip1E_10_uid161_atan2Test(ADDSUB,160)@10
    yip1E_10_uid161_atan2Test_s <= Yip1_917_uid155_atan2Test_b;
    yip1E_10_uid161_atan2Test_cin <= GND_q;
    yip1E_10_uid161_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => redist9_q(17)) & redist9_q) & Yip1_917_uid155_atan2Test_b(0));
    yip1E_10_uid161_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & twoToMiSiXip_uid156_atan2Test_b) & yip1E_10_uid161_atan2Test_cin(0));
    yip1E_10_uid161_atan2Test: PROCESS (yip1E_10_uid161_atan2Test_a, yip1E_10_uid161_atan2Test_b, yip1E_10_uid161_atan2Test_s)
    BEGIN
        IF (yip1E_10_uid161_atan2Test_s = "1") THEN
            yip1E_10_uid161_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid161_atan2Test_a) + SIGNED(yip1E_10_uid161_atan2Test_b));
        ELSE
            yip1E_10_uid161_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid161_atan2Test_a) - SIGNED(yip1E_10_uid161_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_10_uid161_atan2Test_q <= yip1E_10_uid161_atan2Test_o(19 downto 1);

    -- yip1_10_uid167_atan2Test(BITSELECT,166)@10
    yip1_10_uid167_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_10_uid161_atan2Test_q(16 downto 0));
    yip1_10_uid167_atan2Test_b <= yip1_10_uid167_atan2Test_in(16 downto 0);

    -- redist7(DELAY,227)
    redist7 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => yip1_10_uid167_atan2Test_b, xout => redist7_q, clk => clk, aclr => areset );

    -- yip1E_11_uid175_atan2Test(ADDSUB,174)@11
    yip1E_11_uid175_atan2Test_s <= Yip1_1016_uid169_atan2Test_b;
    yip1E_11_uid175_atan2Test_cin <= GND_q;
    yip1E_11_uid175_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => redist7_q(16)) & redist7_q) & Yip1_1016_uid169_atan2Test_b(0));
    yip1E_11_uid175_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & redist5_q) & yip1E_11_uid175_atan2Test_cin(0));
    yip1E_11_uid175_atan2Test: PROCESS (yip1E_11_uid175_atan2Test_a, yip1E_11_uid175_atan2Test_b, yip1E_11_uid175_atan2Test_s)
    BEGIN
        IF (yip1E_11_uid175_atan2Test_s = "1") THEN
            yip1E_11_uid175_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid175_atan2Test_a) + SIGNED(yip1E_11_uid175_atan2Test_b));
        ELSE
            yip1E_11_uid175_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid175_atan2Test_a) - SIGNED(yip1E_11_uid175_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_11_uid175_atan2Test_q <= yip1E_11_uid175_atan2Test_o(18 downto 1);

    -- yip1_11_uid181_atan2Test(BITSELECT,180)@11
    yip1_11_uid181_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_11_uid175_atan2Test_q(15 downto 0));
    yip1_11_uid181_atan2Test_b <= yip1_11_uid181_atan2Test_in(15 downto 0);

    -- Yip1_1115_uid183_atan2Test(BITSELECT,182)@11
    Yip1_1115_uid183_atan2Test_in <= STD_LOGIC_VECTOR(yip1_11_uid181_atan2Test_b);
    Yip1_1115_uid183_atan2Test_b <= Yip1_1115_uid183_atan2Test_in(15 downto 15);

    -- InvMsbSel11_uid190_atan2Test(LOGICAL,189)@11
    InvMsbSel11_uid190_atan2Test_a <= Yip1_1115_uid183_atan2Test_b;
    InvMsbSel11_uid190_atan2Test_q_i <= not (InvMsbSel11_uid190_atan2Test_a);
    InvMsbSel11_uid190_atan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvMsbSel11_uid190_atan2Test_q_i, xout => InvMsbSel11_uid190_atan2Test_q, clk => clk, aclr => areset );

    -- cstArcTan2Mi_11_uid186_atan2Test(CONSTANT,185)
    cstArcTan2Mi_11_uid186_atan2Test_q <= "01111111111111111111111101010101";

    -- InvMsbSel10_uid176_atan2Test(LOGICAL,175)@11
    InvMsbSel10_uid176_atan2Test_a <= Yip1_1016_uid169_atan2Test_b;
    InvMsbSel10_uid176_atan2Test_q <= not (InvMsbSel10_uid176_atan2Test_a);

    -- cstArcTan2Mi_10_uid172_atan2Test(CONSTANT,171)
    cstArcTan2Mi_10_uid172_atan2Test_q <= "0111111111111111111111010101011";

    -- cstArcTan2Mi_9_uid158_atan2Test(CONSTANT,157)
    cstArcTan2Mi_9_uid158_atan2Test_q <= "011111111111111111110101010101";

    -- cstArcTan2Mi_8_uid144_atan2Test(CONSTANT,143)
    cstArcTan2Mi_8_uid144_atan2Test_q <= "01111111111111111101010101011";

    -- cstArcTan2Mi_7_uid130_atan2Test(CONSTANT,129)
    cstArcTan2Mi_7_uid130_atan2Test_q <= "0111111111111111010101010101";

    -- cstArcTan2Mi_6_uid116_atan2Test(CONSTANT,115)
    cstArcTan2Mi_6_uid116_atan2Test_q <= "011111111111110101010101011";

    -- cstArcTan2Mi_5_uid98_atan2Test(CONSTANT,97)
    cstArcTan2Mi_5_uid98_atan2Test_q <= "01111111111101010101011100";

    -- cstArcTan2Mi_4_uid80_atan2Test(CONSTANT,79)
    cstArcTan2Mi_4_uid80_atan2Test_q <= "0111111111010101011011110";

    -- cstArcTan2Mi_3_uid64_atan2Test(CONSTANT,63)
    cstArcTan2Mi_3_uid64_atan2Test_q <= "011111110101011011101010";

    -- cstArcTan2Mi_2_uid48_atan2Test(CONSTANT,47)
    cstArcTan2Mi_2_uid48_atan2Test_q <= "01111101011011011101100";

    -- cstArcTan2Mi_1_uid32_atan2Test(CONSTANT,31)
    cstArcTan2Mi_1_uid32_atan2Test_q <= "0111011010110001100111";

    -- CstArcTan2Mi_020_uid26_atan2Test(BITSELECT,25)@2
    CstArcTan2Mi_020_uid26_atan2Test_in <= STD_LOGIC_VECTOR(cstArcTan2Mi_0_uid20_atan2Test_q);
    CstArcTan2Mi_020_uid26_atan2Test_b <= CstArcTan2Mi_020_uid26_atan2Test_in(20 downto 20);

    -- aip1E_topExtension_uid27_atan2Test(LOGICAL,26)@2
    aip1E_topExtension_uid27_atan2Test_a <= GND_q;
    aip1E_topExtension_uid27_atan2Test_b <= CstArcTan2Mi_020_uid26_atan2Test_b;
    aip1E_topExtension_uid27_atan2Test_q <= aip1E_topExtension_uid27_atan2Test_a or aip1E_topExtension_uid27_atan2Test_b;

    -- cstArcTan2Mi_0_uid20_atan2Test(CONSTANT,19)
    cstArcTan2Mi_0_uid20_atan2Test_q <= "011001001000011111110";

    -- aip1E_mergedSignalTM_uid29_atan2Test(BITJOIN,28)@2
    aip1E_mergedSignalTM_uid29_atan2Test_q <= aip1E_topExtension_uid27_atan2Test_q & cstArcTan2Mi_0_uid20_atan2Test_q;

    -- aip1E_2NA_uid42_atan2Test(BITJOIN,41)@2
    aip1E_2NA_uid42_atan2Test_q <= aip1E_mergedSignalTM_uid29_atan2Test_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_2sumAHighB_uid43_atan2Test(ADDSUB,42)@2
    aip1E_2sumAHighB_uid43_atan2Test_s <= InvMsbSel1_uid33_atan2Test_q;
    aip1E_2sumAHighB_uid43_atan2Test_cin <= GND_q;
    aip1E_2sumAHighB_uid43_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => aip1E_2NA_uid42_atan2Test_q(23)) & aip1E_2NA_uid42_atan2Test_q) & InvMsbSel1_uid33_atan2Test_q(0));
    aip1E_2sumAHighB_uid43_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 22 => cstArcTan2Mi_1_uid32_atan2Test_q(21)) & cstArcTan2Mi_1_uid32_atan2Test_q) & aip1E_2sumAHighB_uid43_atan2Test_cin(0));
    aip1E_2sumAHighB_uid43_atan2Test: PROCESS (aip1E_2sumAHighB_uid43_atan2Test_a, aip1E_2sumAHighB_uid43_atan2Test_b, aip1E_2sumAHighB_uid43_atan2Test_s)
    BEGIN
        IF (aip1E_2sumAHighB_uid43_atan2Test_s = "1") THEN
            aip1E_2sumAHighB_uid43_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2sumAHighB_uid43_atan2Test_a) + SIGNED(aip1E_2sumAHighB_uid43_atan2Test_b));
        ELSE
            aip1E_2sumAHighB_uid43_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2sumAHighB_uid43_atan2Test_a) - SIGNED(aip1E_2sumAHighB_uid43_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_2sumAHighB_uid43_atan2Test_q <= aip1E_2sumAHighB_uid43_atan2Test_o(25 downto 1);

    -- aip1E_uid46_atan2Test(BITSELECT,45)@2
    aip1E_uid46_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_2sumAHighB_uid43_atan2Test_q(23 downto 0));
    aip1E_uid46_atan2Test_b <= aip1E_uid46_atan2Test_in(23 downto 0);

    -- redist29(DELAY,249)
    redist29 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => aip1E_uid46_atan2Test_b, xout => redist29_q, clk => clk, aclr => areset );

    -- aip1E_3NA_uid58_atan2Test(BITJOIN,57)@3
    aip1E_3NA_uid58_atan2Test_q <= redist29_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_3sumAHighB_uid59_atan2Test(ADDSUB,58)@3
    aip1E_3sumAHighB_uid59_atan2Test_s <= InvMsbSel2_uid49_atan2Test_q;
    aip1E_3sumAHighB_uid59_atan2Test_cin <= GND_q;
    aip1E_3sumAHighB_uid59_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => aip1E_3NA_uid58_atan2Test_q(25)) & aip1E_3NA_uid58_atan2Test_q) & InvMsbSel2_uid49_atan2Test_q(0));
    aip1E_3sumAHighB_uid59_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 23 => cstArcTan2Mi_2_uid48_atan2Test_q(22)) & cstArcTan2Mi_2_uid48_atan2Test_q) & aip1E_3sumAHighB_uid59_atan2Test_cin(0));
    aip1E_3sumAHighB_uid59_atan2Test: PROCESS (aip1E_3sumAHighB_uid59_atan2Test_a, aip1E_3sumAHighB_uid59_atan2Test_b, aip1E_3sumAHighB_uid59_atan2Test_s)
    BEGIN
        IF (aip1E_3sumAHighB_uid59_atan2Test_s = "1") THEN
            aip1E_3sumAHighB_uid59_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3sumAHighB_uid59_atan2Test_a) + SIGNED(aip1E_3sumAHighB_uid59_atan2Test_b));
        ELSE
            aip1E_3sumAHighB_uid59_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3sumAHighB_uid59_atan2Test_a) - SIGNED(aip1E_3sumAHighB_uid59_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_3sumAHighB_uid59_atan2Test_q <= aip1E_3sumAHighB_uid59_atan2Test_o(27 downto 1);

    -- aip1E_uid62_atan2Test(BITSELECT,61)@3
    aip1E_uid62_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_3sumAHighB_uid59_atan2Test_q(25 downto 0));
    aip1E_uid62_atan2Test_b <= aip1E_uid62_atan2Test_in(25 downto 0);

    -- redist26(DELAY,246)
    redist26 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => aip1E_uid62_atan2Test_b, xout => redist26_q, clk => clk, aclr => areset );

    -- aip1E_4NA_uid74_atan2Test(BITJOIN,73)@4
    aip1E_4NA_uid74_atan2Test_q <= redist26_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_4sumAHighB_uid75_atan2Test(ADDSUB,74)@4
    aip1E_4sumAHighB_uid75_atan2Test_s <= InvMsbSel3_uid65_atan2Test_q;
    aip1E_4sumAHighB_uid75_atan2Test_cin <= GND_q;
    aip1E_4sumAHighB_uid75_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => aip1E_4NA_uid74_atan2Test_q(27)) & aip1E_4NA_uid74_atan2Test_q) & InvMsbSel3_uid65_atan2Test_q(0));
    aip1E_4sumAHighB_uid75_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 24 => cstArcTan2Mi_3_uid64_atan2Test_q(23)) & cstArcTan2Mi_3_uid64_atan2Test_q) & aip1E_4sumAHighB_uid75_atan2Test_cin(0));
    aip1E_4sumAHighB_uid75_atan2Test: PROCESS (aip1E_4sumAHighB_uid75_atan2Test_a, aip1E_4sumAHighB_uid75_atan2Test_b, aip1E_4sumAHighB_uid75_atan2Test_s)
    BEGIN
        IF (aip1E_4sumAHighB_uid75_atan2Test_s = "1") THEN
            aip1E_4sumAHighB_uid75_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4sumAHighB_uid75_atan2Test_a) + SIGNED(aip1E_4sumAHighB_uid75_atan2Test_b));
        ELSE
            aip1E_4sumAHighB_uid75_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4sumAHighB_uid75_atan2Test_a) - SIGNED(aip1E_4sumAHighB_uid75_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_4sumAHighB_uid75_atan2Test_q <= aip1E_4sumAHighB_uid75_atan2Test_o(29 downto 1);

    -- aip1E_uid78_atan2Test(BITSELECT,77)@4
    aip1E_uid78_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_4sumAHighB_uid75_atan2Test_q(27 downto 0));
    aip1E_uid78_atan2Test_b <= aip1E_uid78_atan2Test_in(27 downto 0);

    -- redist23(DELAY,243)
    redist23 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1 )
    PORT MAP ( xin => aip1E_uid78_atan2Test_b, xout => redist23_q, clk => clk, aclr => areset );

    -- aip1E_5NA_uid90_atan2Test(BITJOIN,89)@5
    aip1E_5NA_uid90_atan2Test_q <= redist23_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_5sumAHighB_uid91_atan2Test(ADDSUB,90)@5
    aip1E_5sumAHighB_uid91_atan2Test_s <= InvMsbSel4_uid81_atan2Test_q;
    aip1E_5sumAHighB_uid91_atan2Test_cin <= GND_q;
    aip1E_5sumAHighB_uid91_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => aip1E_5NA_uid90_atan2Test_q(29)) & aip1E_5NA_uid90_atan2Test_q) & InvMsbSel4_uid81_atan2Test_q(0));
    aip1E_5sumAHighB_uid91_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 25 => cstArcTan2Mi_4_uid80_atan2Test_q(24)) & cstArcTan2Mi_4_uid80_atan2Test_q) & aip1E_5sumAHighB_uid91_atan2Test_cin(0));
    aip1E_5sumAHighB_uid91_atan2Test: PROCESS (aip1E_5sumAHighB_uid91_atan2Test_a, aip1E_5sumAHighB_uid91_atan2Test_b, aip1E_5sumAHighB_uid91_atan2Test_s)
    BEGIN
        IF (aip1E_5sumAHighB_uid91_atan2Test_s = "1") THEN
            aip1E_5sumAHighB_uid91_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5sumAHighB_uid91_atan2Test_a) + SIGNED(aip1E_5sumAHighB_uid91_atan2Test_b));
        ELSE
            aip1E_5sumAHighB_uid91_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5sumAHighB_uid91_atan2Test_a) - SIGNED(aip1E_5sumAHighB_uid91_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_5sumAHighB_uid91_atan2Test_q <= aip1E_5sumAHighB_uid91_atan2Test_o(31 downto 1);

    -- aip1E_uid94_atan2Test(BITSELECT,93)@5
    aip1E_uid94_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_5sumAHighB_uid91_atan2Test_q(29 downto 0));
    aip1E_uid94_atan2Test_b <= aip1E_uid94_atan2Test_in(29 downto 0);

    -- redist20(DELAY,240)
    redist20 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => aip1E_uid94_atan2Test_b, xout => redist20_q, clk => clk, aclr => areset );

    -- aip1E_6NA_uid108_atan2Test(BITJOIN,107)@6
    aip1E_6NA_uid108_atan2Test_q <= redist20_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_6sumAHighB_uid109_atan2Test(ADDSUB,108)@6
    aip1E_6sumAHighB_uid109_atan2Test_s <= InvMsbSel5_uid99_atan2Test_q;
    aip1E_6sumAHighB_uid109_atan2Test_cin <= GND_q;
    aip1E_6sumAHighB_uid109_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => aip1E_6NA_uid108_atan2Test_q(31)) & aip1E_6NA_uid108_atan2Test_q) & InvMsbSel5_uid99_atan2Test_q(0));
    aip1E_6sumAHighB_uid109_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 26 => cstArcTan2Mi_5_uid98_atan2Test_q(25)) & cstArcTan2Mi_5_uid98_atan2Test_q) & aip1E_6sumAHighB_uid109_atan2Test_cin(0));
    aip1E_6sumAHighB_uid109_atan2Test: PROCESS (aip1E_6sumAHighB_uid109_atan2Test_a, aip1E_6sumAHighB_uid109_atan2Test_b, aip1E_6sumAHighB_uid109_atan2Test_s)
    BEGIN
        IF (aip1E_6sumAHighB_uid109_atan2Test_s = "1") THEN
            aip1E_6sumAHighB_uid109_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6sumAHighB_uid109_atan2Test_a) + SIGNED(aip1E_6sumAHighB_uid109_atan2Test_b));
        ELSE
            aip1E_6sumAHighB_uid109_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6sumAHighB_uid109_atan2Test_a) - SIGNED(aip1E_6sumAHighB_uid109_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_6sumAHighB_uid109_atan2Test_q <= aip1E_6sumAHighB_uid109_atan2Test_o(33 downto 1);

    -- aip1E_uid112_atan2Test(BITSELECT,111)@6
    aip1E_uid112_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_6sumAHighB_uid109_atan2Test_q(31 downto 0));
    aip1E_uid112_atan2Test_b <= aip1E_uid112_atan2Test_in(31 downto 0);

    -- redist17(DELAY,237)
    redist17 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => aip1E_uid112_atan2Test_b, xout => redist17_q, clk => clk, aclr => areset );

    -- aip1E_7NA_uid122_atan2Test(BITJOIN,121)@7
    aip1E_7NA_uid122_atan2Test_q <= redist17_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_7sumAHighB_uid123_atan2Test(ADDSUB,122)@7
    aip1E_7sumAHighB_uid123_atan2Test_s <= InvMsbSel6_uid117_atan2Test_q;
    aip1E_7sumAHighB_uid123_atan2Test_cin <= GND_q;
    aip1E_7sumAHighB_uid123_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => aip1E_7NA_uid122_atan2Test_q(33)) & aip1E_7NA_uid122_atan2Test_q) & InvMsbSel6_uid117_atan2Test_q(0));
    aip1E_7sumAHighB_uid123_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 27 => cstArcTan2Mi_6_uid116_atan2Test_q(26)) & cstArcTan2Mi_6_uid116_atan2Test_q) & aip1E_7sumAHighB_uid123_atan2Test_cin(0));
    aip1E_7sumAHighB_uid123_atan2Test: PROCESS (aip1E_7sumAHighB_uid123_atan2Test_a, aip1E_7sumAHighB_uid123_atan2Test_b, aip1E_7sumAHighB_uid123_atan2Test_s)
    BEGIN
        IF (aip1E_7sumAHighB_uid123_atan2Test_s = "1") THEN
            aip1E_7sumAHighB_uid123_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7sumAHighB_uid123_atan2Test_a) + SIGNED(aip1E_7sumAHighB_uid123_atan2Test_b));
        ELSE
            aip1E_7sumAHighB_uid123_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7sumAHighB_uid123_atan2Test_a) - SIGNED(aip1E_7sumAHighB_uid123_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_7sumAHighB_uid123_atan2Test_q <= aip1E_7sumAHighB_uid123_atan2Test_o(35 downto 1);

    -- aip1E_uid126_atan2Test(BITSELECT,125)@7
    aip1E_uid126_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_7sumAHighB_uid123_atan2Test_q(33 downto 0));
    aip1E_uid126_atan2Test_b <= aip1E_uid126_atan2Test_in(33 downto 0);

    -- redist14(DELAY,234)
    redist14 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => aip1E_uid126_atan2Test_b, xout => redist14_q, clk => clk, aclr => areset );

    -- aip1E_8NA_uid136_atan2Test(BITJOIN,135)@8
    aip1E_8NA_uid136_atan2Test_q <= redist14_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_8sumAHighB_uid137_atan2Test(ADDSUB,136)@8
    aip1E_8sumAHighB_uid137_atan2Test_s <= InvMsbSel7_uid131_atan2Test_q;
    aip1E_8sumAHighB_uid137_atan2Test_cin <= GND_q;
    aip1E_8sumAHighB_uid137_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 36 => aip1E_8NA_uid136_atan2Test_q(35)) & aip1E_8NA_uid136_atan2Test_q) & InvMsbSel7_uid131_atan2Test_q(0));
    aip1E_8sumAHighB_uid137_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 28 => cstArcTan2Mi_7_uid130_atan2Test_q(27)) & cstArcTan2Mi_7_uid130_atan2Test_q) & aip1E_8sumAHighB_uid137_atan2Test_cin(0));
    aip1E_8sumAHighB_uid137_atan2Test: PROCESS (aip1E_8sumAHighB_uid137_atan2Test_a, aip1E_8sumAHighB_uid137_atan2Test_b, aip1E_8sumAHighB_uid137_atan2Test_s)
    BEGIN
        IF (aip1E_8sumAHighB_uid137_atan2Test_s = "1") THEN
            aip1E_8sumAHighB_uid137_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8sumAHighB_uid137_atan2Test_a) + SIGNED(aip1E_8sumAHighB_uid137_atan2Test_b));
        ELSE
            aip1E_8sumAHighB_uid137_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8sumAHighB_uid137_atan2Test_a) - SIGNED(aip1E_8sumAHighB_uid137_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_8sumAHighB_uid137_atan2Test_q <= aip1E_8sumAHighB_uid137_atan2Test_o(37 downto 1);

    -- aip1E_uid140_atan2Test(BITSELECT,139)@8
    aip1E_uid140_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_8sumAHighB_uid137_atan2Test_q(35 downto 0));
    aip1E_uid140_atan2Test_b <= aip1E_uid140_atan2Test_in(35 downto 0);

    -- redist11(DELAY,231)
    redist11 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => aip1E_uid140_atan2Test_b, xout => redist11_q, clk => clk, aclr => areset );

    -- aip1E_9NA_uid150_atan2Test(BITJOIN,149)@9
    aip1E_9NA_uid150_atan2Test_q <= redist11_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_9sumAHighB_uid151_atan2Test(ADDSUB,150)@9
    aip1E_9sumAHighB_uid151_atan2Test_s <= InvMsbSel8_uid145_atan2Test_q;
    aip1E_9sumAHighB_uid151_atan2Test_cin <= GND_q;
    aip1E_9sumAHighB_uid151_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 38 => aip1E_9NA_uid150_atan2Test_q(37)) & aip1E_9NA_uid150_atan2Test_q) & InvMsbSel8_uid145_atan2Test_q(0));
    aip1E_9sumAHighB_uid151_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 29 => cstArcTan2Mi_8_uid144_atan2Test_q(28)) & cstArcTan2Mi_8_uid144_atan2Test_q) & aip1E_9sumAHighB_uid151_atan2Test_cin(0));
    aip1E_9sumAHighB_uid151_atan2Test: PROCESS (aip1E_9sumAHighB_uid151_atan2Test_a, aip1E_9sumAHighB_uid151_atan2Test_b, aip1E_9sumAHighB_uid151_atan2Test_s)
    BEGIN
        IF (aip1E_9sumAHighB_uid151_atan2Test_s = "1") THEN
            aip1E_9sumAHighB_uid151_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9sumAHighB_uid151_atan2Test_a) + SIGNED(aip1E_9sumAHighB_uid151_atan2Test_b));
        ELSE
            aip1E_9sumAHighB_uid151_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9sumAHighB_uid151_atan2Test_a) - SIGNED(aip1E_9sumAHighB_uid151_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_9sumAHighB_uid151_atan2Test_q <= aip1E_9sumAHighB_uid151_atan2Test_o(39 downto 1);

    -- aip1E_uid154_atan2Test(BITSELECT,153)@9
    aip1E_uid154_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_9sumAHighB_uid151_atan2Test_q(37 downto 0));
    aip1E_uid154_atan2Test_b <= aip1E_uid154_atan2Test_in(37 downto 0);

    -- redist8(DELAY,228)
    redist8 : dspba_delay
    GENERIC MAP ( width => 38, depth => 1 )
    PORT MAP ( xin => aip1E_uid154_atan2Test_b, xout => redist8_q, clk => clk, aclr => areset );

    -- aip1E_10NA_uid164_atan2Test(BITJOIN,163)@10
    aip1E_10NA_uid164_atan2Test_q <= redist8_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_10sumAHighB_uid165_atan2Test(ADDSUB,164)@10
    aip1E_10sumAHighB_uid165_atan2Test_s <= InvMsbSel9_uid159_atan2Test_q;
    aip1E_10sumAHighB_uid165_atan2Test_cin <= GND_q;
    aip1E_10sumAHighB_uid165_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => aip1E_10NA_uid164_atan2Test_q(39)) & aip1E_10NA_uid164_atan2Test_q) & InvMsbSel9_uid159_atan2Test_q(0));
    aip1E_10sumAHighB_uid165_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 30 => cstArcTan2Mi_9_uid158_atan2Test_q(29)) & cstArcTan2Mi_9_uid158_atan2Test_q) & aip1E_10sumAHighB_uid165_atan2Test_cin(0));
    aip1E_10sumAHighB_uid165_atan2Test: PROCESS (aip1E_10sumAHighB_uid165_atan2Test_a, aip1E_10sumAHighB_uid165_atan2Test_b, aip1E_10sumAHighB_uid165_atan2Test_s)
    BEGIN
        IF (aip1E_10sumAHighB_uid165_atan2Test_s = "1") THEN
            aip1E_10sumAHighB_uid165_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10sumAHighB_uid165_atan2Test_a) + SIGNED(aip1E_10sumAHighB_uid165_atan2Test_b));
        ELSE
            aip1E_10sumAHighB_uid165_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10sumAHighB_uid165_atan2Test_a) - SIGNED(aip1E_10sumAHighB_uid165_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_10sumAHighB_uid165_atan2Test_q <= aip1E_10sumAHighB_uid165_atan2Test_o(41 downto 1);

    -- aip1E_uid168_atan2Test(BITSELECT,167)@10
    aip1E_uid168_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_10sumAHighB_uid165_atan2Test_q(39 downto 0));
    aip1E_uid168_atan2Test_b <= aip1E_uid168_atan2Test_in(39 downto 0);

    -- redist6(DELAY,226)
    redist6 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1 )
    PORT MAP ( xin => aip1E_uid168_atan2Test_b, xout => redist6_q, clk => clk, aclr => areset );

    -- aip1E_11NA_uid178_atan2Test(BITJOIN,177)@11
    aip1E_11NA_uid178_atan2Test_q <= redist6_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_11sumAHighB_uid179_atan2Test(ADDSUB,178)@11
    aip1E_11sumAHighB_uid179_atan2Test_s <= InvMsbSel10_uid176_atan2Test_q;
    aip1E_11sumAHighB_uid179_atan2Test_cin <= GND_q;
    aip1E_11sumAHighB_uid179_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 42 => aip1E_11NA_uid178_atan2Test_q(41)) & aip1E_11NA_uid178_atan2Test_q) & InvMsbSel10_uid176_atan2Test_q(0));
    aip1E_11sumAHighB_uid179_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 31 => cstArcTan2Mi_10_uid172_atan2Test_q(30)) & cstArcTan2Mi_10_uid172_atan2Test_q) & aip1E_11sumAHighB_uid179_atan2Test_cin(0));
    aip1E_11sumAHighB_uid179_atan2Test: PROCESS (aip1E_11sumAHighB_uid179_atan2Test_a, aip1E_11sumAHighB_uid179_atan2Test_b, aip1E_11sumAHighB_uid179_atan2Test_s)
    BEGIN
        IF (aip1E_11sumAHighB_uid179_atan2Test_s = "1") THEN
            aip1E_11sumAHighB_uid179_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11sumAHighB_uid179_atan2Test_a) + SIGNED(aip1E_11sumAHighB_uid179_atan2Test_b));
        ELSE
            aip1E_11sumAHighB_uid179_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11sumAHighB_uid179_atan2Test_a) - SIGNED(aip1E_11sumAHighB_uid179_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_11sumAHighB_uid179_atan2Test_q <= aip1E_11sumAHighB_uid179_atan2Test_o(43 downto 1);

    -- aip1E_uid182_atan2Test(BITSELECT,181)@11
    aip1E_uid182_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_11sumAHighB_uid179_atan2Test_q(41 downto 0));
    aip1E_uid182_atan2Test_b <= aip1E_uid182_atan2Test_in(41 downto 0);

    -- redist4(DELAY,224)
    redist4 : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => aip1E_uid182_atan2Test_b, xout => redist4_q, clk => clk, aclr => areset );

    -- aip1E_12NA_uid192_atan2Test(BITJOIN,191)@12
    aip1E_12NA_uid192_atan2Test_q <= redist4_q & aip1E_2CostZeroPaddingA_uid41_atan2Test_q;

    -- aip1E_12sumAHighB_uid193_atan2Test(ADDSUB,192)@12
    aip1E_12sumAHighB_uid193_atan2Test_s <= InvMsbSel11_uid190_atan2Test_q;
    aip1E_12sumAHighB_uid193_atan2Test_cin <= GND_q;
    aip1E_12sumAHighB_uid193_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => aip1E_12NA_uid192_atan2Test_q(43)) & aip1E_12NA_uid192_atan2Test_q) & InvMsbSel11_uid190_atan2Test_q(0));
    aip1E_12sumAHighB_uid193_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 32 => cstArcTan2Mi_11_uid186_atan2Test_q(31)) & cstArcTan2Mi_11_uid186_atan2Test_q) & aip1E_12sumAHighB_uid193_atan2Test_cin(0));
    aip1E_12sumAHighB_uid193_atan2Test: PROCESS (aip1E_12sumAHighB_uid193_atan2Test_a, aip1E_12sumAHighB_uid193_atan2Test_b, aip1E_12sumAHighB_uid193_atan2Test_s)
    BEGIN
        IF (aip1E_12sumAHighB_uid193_atan2Test_s = "1") THEN
            aip1E_12sumAHighB_uid193_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12sumAHighB_uid193_atan2Test_a) + SIGNED(aip1E_12sumAHighB_uid193_atan2Test_b));
        ELSE
            aip1E_12sumAHighB_uid193_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12sumAHighB_uid193_atan2Test_a) - SIGNED(aip1E_12sumAHighB_uid193_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_12sumAHighB_uid193_atan2Test_q <= aip1E_12sumAHighB_uid193_atan2Test_o(45 downto 1);

    -- aip1E_uid196_atan2Test(BITSELECT,195)@12
    aip1E_uid196_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_12sumAHighB_uid193_atan2Test_q(43 downto 0));
    aip1E_uid196_atan2Test_b <= aip1E_uid196_atan2Test_in(43 downto 0);

    -- alphaPreRnd_uid197_atan2Test(BITSELECT,196)@12
    alphaPreRnd_uid197_atan2Test_in <= aip1E_uid196_atan2Test_b;
    alphaPreRnd_uid197_atan2Test_b <= alphaPreRnd_uid197_atan2Test_in(43 downto 31);

    -- highABits_uid199_atan2Test(BITSELECT,198)@12
    highABits_uid199_atan2Test_in <= alphaPreRnd_uid197_atan2Test_b;
    highABits_uid199_atan2Test_b <= highABits_uid199_atan2Test_in(12 downto 1);

    -- redist2(DELAY,222)
    redist2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => highABits_uid199_atan2Test_b, xout => redist2_q, clk => clk, aclr => areset );

    -- alphaPostRndhigh_uid200_atan2Test(ADD,199)@13
    alphaPostRndhigh_uid200_atan2Test_a <= STD_LOGIC_VECTOR("0" & redist2_q);
    alphaPostRndhigh_uid200_atan2Test_b <= STD_LOGIC_VECTOR("000000000000" & VCC_q);
    alphaPostRndhigh_uid200_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(alphaPostRndhigh_uid200_atan2Test_a) + UNSIGNED(alphaPostRndhigh_uid200_atan2Test_b));
    alphaPostRndhigh_uid200_atan2Test_q <= alphaPostRndhigh_uid200_atan2Test_o(12 downto 0);

    -- lowRangeA_uid198_atan2Test(BITSELECT,197)@12
    lowRangeA_uid198_atan2Test_in <= alphaPreRnd_uid197_atan2Test_b(0 downto 0);
    lowRangeA_uid198_atan2Test_b <= lowRangeA_uid198_atan2Test_in(0 downto 0);

    -- redist3(DELAY,223)
    redist3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => lowRangeA_uid198_atan2Test_b, xout => redist3_q, clk => clk, aclr => areset );

    -- alphaPostRnd_uid198_uid201_atan2Test(BITJOIN,200)@13
    alphaPostRnd_uid198_uid201_atan2Test_q <= alphaPostRndhigh_uid200_atan2Test_q & redist3_q;

    -- atanRes_uid202_atan2Test(BITSELECT,201)@13
    atanRes_uid202_atan2Test_in <= alphaPostRnd_uid198_uid201_atan2Test_q(12 downto 0);
    atanRes_uid202_atan2Test_b <= atanRes_uid202_atan2Test_in(12 downto 0);

    -- xNotZero_uid17_atan2Test(LOGICAL,16)@0
    xNotZero_uid17_atan2Test_a <= x;
    xNotZero_uid17_atan2Test_q <= "1" WHEN xNotZero_uid17_atan2Test_a /= "000000000000" ELSE "0";

    -- xZero_uid18_atan2Test(LOGICAL,17)@0
    xZero_uid18_atan2Test_a <= xNotZero_uid17_atan2Test_q;
    xZero_uid18_atan2Test_q <= not (xZero_uid18_atan2Test_a);

    -- yNotZero_uid15_atan2Test(LOGICAL,14)@0
    yNotZero_uid15_atan2Test_a <= y;
    yNotZero_uid15_atan2Test_q <= "1" WHEN yNotZero_uid15_atan2Test_a /= "000000000000" ELSE "0";

    -- yZero_uid16_atan2Test(LOGICAL,15)@0
    yZero_uid16_atan2Test_a <= yNotZero_uid15_atan2Test_q;
    yZero_uid16_atan2Test_q <= not (yZero_uid16_atan2Test_a);

    -- concXZeroYZero_uid209_atan2Test(BITJOIN,208)@0
    concXZeroYZero_uid209_atan2Test_q <= xZero_uid18_atan2Test_q & yZero_uid16_atan2Test_q;

    -- redist1(DELAY,221)
    redist1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 13 )
    PORT MAP ( xin => concXZeroYZero_uid209_atan2Test_q, xout => redist1_q, clk => clk, aclr => areset );

    -- atanResPostExc_uid210_atan2Test(MUX,209)@13
    atanResPostExc_uid210_atan2Test_s <= redist1_q;
    atanResPostExc_uid210_atan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            atanResPostExc_uid210_atan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (atanResPostExc_uid210_atan2Test_s) IS
                WHEN "00" => atanResPostExc_uid210_atan2Test_q <= atanRes_uid202_atan2Test_b;
                WHEN "01" => atanResPostExc_uid210_atan2Test_q <= cstZeroOutFormat_uid203_atan2Test_q;
                WHEN "10" => atanResPostExc_uid210_atan2Test_q <= constPio2P2u_mergedSignalTM_uid207_atan2Test_q;
                WHEN "11" => atanResPostExc_uid210_atan2Test_q <= cstZeroOutFormat_uid203_atan2Test_q;
                WHEN OTHERS => atanResPostExc_uid210_atan2Test_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- constantZeroOutFormat_uid214_atan2Test(CONSTANT,213)
    constantZeroOutFormat_uid214_atan2Test_q <= "0000000000000";

    -- concSigns_uid211_atan2Test(BITJOIN,210)@0
    concSigns_uid211_atan2Test_q <= signX_uid7_atan2Test_b & signY_uid8_atan2Test_b;

    -- redist0(DELAY,220)
    redist0 : dspba_delay
    GENERIC MAP ( width => 2, depth => 14 )
    PORT MAP ( xin => concSigns_uid211_atan2Test_q, xout => redist0_q, clk => clk, aclr => areset );

    -- secondOperand_uid217_atan2Test(MUX,216)@14
    secondOperand_uid217_atan2Test_s <= redist0_q;
    secondOperand_uid217_atan2Test: PROCESS (secondOperand_uid217_atan2Test_s, constantZeroOutFormat_uid214_atan2Test_q, atanResPostExc_uid210_atan2Test_q, constPi_uid213_atan2Test_q)
    BEGIN
        CASE (secondOperand_uid217_atan2Test_s) IS
            WHEN "00" => secondOperand_uid217_atan2Test_q <= constantZeroOutFormat_uid214_atan2Test_q;
            WHEN "01" => secondOperand_uid217_atan2Test_q <= atanResPostExc_uid210_atan2Test_q;
            WHEN "10" => secondOperand_uid217_atan2Test_q <= atanResPostExc_uid210_atan2Test_q;
            WHEN "11" => secondOperand_uid217_atan2Test_q <= constPi_uid213_atan2Test_q;
            WHEN OTHERS => secondOperand_uid217_atan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- constPiP2u_uid212_atan2Test(CONSTANT,211)
    constPiP2u_uid212_atan2Test_q <= "1100100100101";

    -- constantZeroOutFormatP2u_uid215_atan2Test(CONSTANT,214)
    constantZeroOutFormatP2u_uid215_atan2Test_q <= "0000000000100";

    -- firstOperand_uid216_atan2Test(MUX,215)@14
    firstOperand_uid216_atan2Test_s <= redist0_q;
    firstOperand_uid216_atan2Test: PROCESS (firstOperand_uid216_atan2Test_s, atanResPostExc_uid210_atan2Test_q, constantZeroOutFormatP2u_uid215_atan2Test_q, constPiP2u_uid212_atan2Test_q)
    BEGIN
        CASE (firstOperand_uid216_atan2Test_s) IS
            WHEN "00" => firstOperand_uid216_atan2Test_q <= atanResPostExc_uid210_atan2Test_q;
            WHEN "01" => firstOperand_uid216_atan2Test_q <= constantZeroOutFormatP2u_uid215_atan2Test_q;
            WHEN "10" => firstOperand_uid216_atan2Test_q <= constPiP2u_uid212_atan2Test_q;
            WHEN "11" => firstOperand_uid216_atan2Test_q <= atanResPostExc_uid210_atan2Test_q;
            WHEN OTHERS => firstOperand_uid216_atan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outResExtended_uid218_atan2Test(SUB,217)@14
    outResExtended_uid218_atan2Test_a <= STD_LOGIC_VECTOR("0" & firstOperand_uid216_atan2Test_q);
    outResExtended_uid218_atan2Test_b <= STD_LOGIC_VECTOR("0" & secondOperand_uid217_atan2Test_q);
    outResExtended_uid218_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(outResExtended_uid218_atan2Test_a) - UNSIGNED(outResExtended_uid218_atan2Test_b));
    outResExtended_uid218_atan2Test_q <= outResExtended_uid218_atan2Test_o(13 downto 0);

    -- atanResPostRR_uid219_atan2Test(BITSELECT,218)@14
    atanResPostRR_uid219_atan2Test_in <= STD_LOGIC_VECTOR(outResExtended_uid218_atan2Test_q);
    atanResPostRR_uid219_atan2Test_b <= atanResPostRR_uid219_atan2Test_in(13 downto 2);

    -- xOut(GPOUT,4)@14
    q <= atanResPostRR_uid219_atan2Test_b;

END normal;
