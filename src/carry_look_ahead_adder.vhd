library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity carry_look_ahead_adder is port (
  a : in std_logic_vector( 3 downto 0 ) ;
  b : in std_logic_vector( 3 downto 0 ) ;
  cin : in std_logic ;
  sum : out std_logic_vector( 3 downto 0 ) ;
  cout : out std_logic
);
end entity ;

architecture gate_level of carry_look_ahead_adder is
begin
end architecture ;
