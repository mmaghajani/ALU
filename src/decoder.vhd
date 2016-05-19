library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity decoder is port (
  a : in std_logic ;
  b : in std_logic ;
  c : in std_logic ;
  i0 : out std_logic ;
  i1 : out std_logic ;
  i2 : out std_logic ;
  i3 : out std_logic ;
  i4 : out std_logic ;
  i5 : out std_logic ;
  i6 : out std_logic ;
  i7 : out std_logic 
);
end entity ;

architecture gate_level of decoder is
signal anot , bnot , cnot : std_logic ;
begin
  anot <= not a ;
  bnot <= not b ;
  cnot <= not c ;
  
  i0 <= anot and bnot and cnot ;
  i1 <= anot and bnot and c ;
  i2 <= anot and b and cnot ;
  i3 <= anot and b and c ;
  i4 <= a and bnot and cnot ;
  i5 <= a and bnot and c ;
  i6 <= a and b and cnot ;
  i7 <= a and b and c ;
end architecture ;

