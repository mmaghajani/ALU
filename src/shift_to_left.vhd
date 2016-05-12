library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity shift_to_left is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end entity ;

architecture gate_level of shift_to_left is 
signal temp_in : std_logic_vector( 7 downto 0 ) ;
signal temp_out : std_logic_vector( 7 downto 0 ) ;
begin
  temp_in <= a ;
  temp_out(0) <= '0' ;
  temp_out(1) <= temp_in(0) ;
  temp_out(2) <= temp_in(1) ;
  temp_out(3) <= temp_in(2) ;
  temp_out(4) <= temp_in(3) ;
  temp_out(5) <= temp_in(4) ;
  temp_out(6) <= temp_in(5) ;
  temp_out(7) <= temp_in(6) ;
  output <= temp_out ;
  
  carry_flag <= '0' ;
  sign_flag <= '0' ;
  
  zero_flag <= not( temp_in(0) or temp_in(1) or temp_in(2) or temp_in(3) or temp_in(4) or
   temp_in(5) or temp_in(6) or temp_in(7) ) ;
end architecture ;


