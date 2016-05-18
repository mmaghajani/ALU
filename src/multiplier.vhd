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
  sign_flag <= '0' ;
  avf_flag <= '0' ;
  process( clk )
    variable b_temp : std_logic_vector( 7 downto 0 ) := b ;
    variable f : std_logic_vector( 7 downto 0 ) := "00000000" ;
    variable sc : integer := 8 ;
    variable e : std_logic := '0' ;
    variable temp : std_logic_vector( 8 downto 0 ) ;
    begin
      output <= f ;
      zero_flag <= not( f(0) or f(1) or f(2) or f(3) or f(4) or f(5) or f(6) or f(7) ) ;
      if( sc = 8 )then 
        b_temp := b ;
      end if ;
      if( clk'event and clk = '1' )then
      if( sc >= 0 )then
        if( b_temp(0) = '1' )then
          temp := ("0"&f) + ("0"&a) ;
          f := temp( 7 downto 0 ) ;
          e := temp(8) ;          
        end if ;
        
        b_temp := f(0) & b_temp( 7 downto 1 ) ;
        f := e & f( 7 downto 1 ) ;
        e := '0' ;
        sc := sc - 1 ;
      end if ;
      end if ;
    end process ;
end architecture ;