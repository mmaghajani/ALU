library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity multiplier is port (
  clk : in std_logic ;
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  avf_flag : out std_logic ;
  zero_flag : out std_logic ;
  sign_flag : out std_logic 
);
end entity ;
  
architecture gate_level of multiplier is 
begin
  process( clk )
    variable b_temp : std_logic_vector( 7 downto 0 ) := b ;
    variable f : std_logic_vector( 7 downto 0 ) := "00000000" ;
    variable sc : integer := 7 ;
    variable e : std_logic := '0' ;
    variable temp : std_logic_vector( 8 downto 0 ) ;
    begin
      if( clk'event and clk = '1' )then
        if( b_temp(0) = '1' )then
          f := f + a ;
          temp := '0'&f + '0'&a ;
          e := temp(8) ;          
        end if ;
        
        b_temp := f(0) & b_temp( 7 downto 1 ) ;
        f := e & f( 7 downto 1 ) ;
        e := '0' ;
        sc := sc - 1 ;
      end if ;
    end process ;
end architecture ;