----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:57 06/29/2018 
-- Design Name: 
-- Module Name:    bigfifo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use IEEE.NUMERIC_STD.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bigfifo is
port(datain :in std_ulogic_vector(7 downto 0);
clock : in std_logic ;
pixel_1 : out std_ulogic_vector(7 downto 0);-- to add a signed bit as filter kernel are signed nos
pixel_2 : out std_ulogic_vector(7 downto 0);
pixel_3 : out std_ulogic_vector(7 downto 0);
pixel_4 : out std_ulogic_vector(7 downto 0);
pixel_5 : out std_ulogic_vector(7 downto 0);
pixel_6 : out std_ulogic_vector(7 downto 0);
pixel_7 : out std_ulogic_vector(7 downto 0);
pixel_8 : out std_ulogic_vector(7 downto 0);
pixel_9 : out std_ulogic_vector(7 downto 0);
filling_buffer : out std_logic;
emptying_buffer :out std_logic;
-- for debugging purposes
datardy :out std_logic;
fifo1full : out std_logic;
fifo2full : out std_logic;
fifo3full : out std_logic;
testread1 : out std_logic;
testread2 : out std_logic;
fifo1_to_fifo2 : out std_ulogic_vector(7 downto 0);
fifo2_to_fifo3 : out std_ulogic_vector(7 downto 0);
reset : in std_logic;
pointer1 : out std_logic_vector( 3 downto 0);
pointer2 : out std_logic_vector( 3 downto 0);
pointer3 : out std_logic_vector( 3 downto 0);
pointer4 : out std_logic_vector( 7 downto 0);
pointer5 : out std_logic_vector( 7 downto 0);
pointer6 : out std_logic_vector( 7 downto 0);
pointer7 : out std_logic_vector( 7 downto 0);
pointer8 : out std_logic_vector( 7 downto 0);
pointer9 : out std_logic_vector( 7 downto 0);
wrpointerf1 : out std_logic_vector( 7 downto 0);
wrpointerf2 : out std_logic_vector( 7 downto 0);
wrpointerf3 : out std_logic_vector( 3 downto 0);
read1ptr : out std_logic_vector( 7 downto 0);
read2ptr :  out std_logic_vector( 7 downto 0)
);



end bigfifo;

architecture Behavioral of bigfifo is
component fifo is
port(
clk :in std_logic ;
datain :in std_ulogic_vector(7 downto 0);
dataout1 :out std_ulogic_vector(7 downto 0);
dataout2 :out std_ulogic_vector(7 downto 0);
dataout3 :out std_ulogic_vector(7 downto 0);
dataout :out std_ulogic_vector(7 downto 0);
wr :in std_logic;
rd1 :in std_logic;
rd2 :in std_logic;
rd3 :in std_logic;
rd :in std_logic;
full :out std_logic;
empty:out std_logic;
pointer1 : out std_logic_vector(7 downto 0);
pointer2 : out std_logic_vector(7 downto 0);
pointer3 : out std_logic_vector(7 downto 0);
wrpointerf : out std_logic_vector(7 downto 0);
read1ptr : out std_logic_vector( 7 downto 0)
);
end component;

component small_fifo is
port(
clk :in std_logic ;
datain :in std_ulogic_vector(7 downto 0);
dataout1 :out std_ulogic_vector(7 downto 0);
dataout2 :out std_ulogic_vector(7 downto 0);
dataout3 :out std_ulogic_vector(7 downto 0);
--dataout :out std_logic_vector(7 downto 0);
wr :in std_logic;
rd1 :in std_logic;
rd2 :in std_logic;
rd3 :in std_logic;
--rd :in std_logic;
full :out std_logic;
empty:out std_logic;
pointer1 : out std_logic_vector(3 downto 0);
pointer2 : out std_logic_vector(3 downto 0);
pointer3 : out std_logic_vector(3 downto 0);
wrpointerf3 : out std_logic_vector(3 downto 0)
);
end component;

signal wr_input : std_ulogic_vector( 7 downto 0);-- better to create a signal for original input instead of directly joining input port to fifo
-- internal fifo connections
signal f1_to_f2 : std_ulogic_vector( 7 downto 0);
signal f2_to_f3 : std_ulogic_vector(7 downto 0);
-- pixels output
signal pixel_1_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_2_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_3_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_4_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_5_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_6_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_7_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_8_unsigned :std_ulogic_vector (7 downto 0);
signal pixel_9_unsigned :std_ulogic_vector (7 downto 0);
-- write enable in individual fifo
signal wr_enable1 : std_logic :='1';
signal wr_enable2 : std_logic :='0';
signal wr_enable3 : std_logic :='0';
-- read enable from 3 pipes in fifo1
signal fifo1_r1 : std_logic :='0';
signal fifo1_r2 : std_logic :='0' ;
signal fifo1_r3 : std_logic :='0';
-- read enable from 3 pipes in fifo2
signal fifo2_r1 : std_logic :='0';
signal fifo2_r2 : std_logic :='0';
signal fifo2_r3 : std_logic :='0';
-- read enable from 3 pipes in fifo3
signal fifo3_r1 : std_logic :='0';
signal fifo3_r2 : std_logic :='0';
signal fifo3_r3 : std_logic :='0';
-- read for popping out values from 1 fifo and send to next fifo
signal fifo1_r : std_logic :='0';
signal fifo2_r : std_logic :='0';
-- indicates status of each fifo( whether full or empty)
signal fifo1_full : std_logic ;
signal fifo1_empty : std_logic ;
signal fifo2_full : std_logic ;
signal fifo2_empty : std_logic ;
signal fifo3_full : std_logic ;
signal fifo3_empty : std_logic ;
signal zerobit :std_logic := '0';
signal datardy_sig : std_logic :='0'; 
--signal pointerpipe1 : std_logic_vector(4 downto 0);
--signal pointerpipe2 : std_logic_vector(4 downto 0);
--signal pointerpipe3 : std_logic_vector(4 downto 0);
begin
wr_input <= datain;

FIFO1 : fifo port map(
clk => clock,
datain => wr_input,
dataout1 => pixel_7_unsigned,
dataout2 => pixel_8_unsigned,
dataout3 => pixel_9_unsigned,
dataout => f1_to_f2,
wr => wr_enable1,
rd1 => fifo1_r1,
rd2 => fifo1_r2,
rd3 => fifo1_r3,
rd => fifo1_r,
full => fifo1_full,
empty => fifo1_empty,
pointer1 => pointer7,
pointer2 => pointer8,
pointer3 => pointer9,
wrpointerf => wrpointerf1,
read1ptr=>read1ptr
);

FIFO2 : fifo port map(
clk => clock,
datain => f1_to_f2,
dataout1 => pixel_4_unsigned,
dataout2 => pixel_5_unsigned,
dataout3 => pixel_6_unsigned,
dataout => f2_to_f3,
wr => wr_enable2 ,
rd1 => fifo2_r1,
rd2 => fifo2_r2,
rd3 => fifo2_r3,
rd => fifo2_r,
full => fifo2_full,
empty => fifo2_empty,
pointer1 => pointer4,
pointer2 => pointer5,
pointer3 => pointer6,
wrpointerf => wrpointerf2,
read1ptr => read2ptr
);

FIFO3 :small_fifo port map(
clk => clock,
datain => f2_to_f3,
dataout1 => pixel_1_unsigned,
dataout2 => pixel_2_unsigned,
dataout3 => pixel_3_unsigned,
wr => wr_enable3,
rd1 => fifo3_r1,
rd2 => fifo3_r2,
rd3 => fifo3_r3,
full => fifo3_full,
empty => fifo3_empty,
pointer1 => pointer1,
pointer2 => pointer2,
pointer3 => pointer3,
wrpointerf3 => wrpointerf3
);

process(clock)
variable flag_fifo1 :std_logic := '0'; --used flags to ensure that the following blocks of code are executed only once

begin
if(clock'event and clock='1' and fifo1_full ='1' and flag_fifo1='0') then
fifo1_r <= '1';
wr_enable2 <= '1';
fifo1full<= '1';--for debug
flag_fifo1 := '1';
end if;
end process;

process(clock)
variable flag_fifo2 :std_logic := '0';

begin
if(clock'event and clock='1' and fifo2_full ='1' and flag_fifo2 ='0') then
fifo2_r <= '1';
wr_enable3 <= '1';
fifo2full<= '1'; -- for debug
flag_fifo2 := '1';
end if;
end process;

process(clock)
variable flag_fifo3 :std_logic := '0';
begin
if(clock'event and clock='1' and fifo3_full ='1' and flag_fifo3 ='0') then
fifo3full <= '1'; --for debug
fifo1_r1 <= '1';
fifo1_r2 <= '1';
fifo1_r3 <= '1';
fifo2_r1 <= '1';
fifo2_r2 <= '1';
fifo2_r3 <= '1';
fifo3_r1 <= '1';
fifo3_r2 <= '1';
fifo3_r3 <= '1';
datardy_sig<='1'; 
--activated all the 9 pixel pipes
flag_fifo3 := '1';
end if;
end process;
datardy<=datardy_sig ;--and (not reset);
pixel_1 <= pixel_1_unsigned;
pixel_2 <= pixel_2_unsigned;
pixel_3 <= pixel_3_unsigned;
pixel_4 <= pixel_4_unsigned;
pixel_5 <= pixel_5_unsigned;
pixel_6 <= pixel_6_unsigned;
pixel_7 <= pixel_7_unsigned;
pixel_8 <= pixel_8_unsigned;
pixel_9 <= pixel_9_unsigned;
testread1 <=fifo1_r;
testread2 <=fifo2_r;
fifo1_to_fifo2 <= f1_to_f2;
fifo2_to_fifo3 <= f2_to_f3;
end Behavioral;

