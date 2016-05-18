library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity divider is port (
  clk : in std_logic ;
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  avf_flag : out std_logic ;
  zero_flag : out std_logic ;
  sign_flag : out std_logic
);
end entity ;
