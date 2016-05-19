library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity divider is port (
  clk : in std_logic ;
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  do : in std_logic ;
  output : out std_logic_vector( 7 downto 0 ) ;
  avf_flag : out std_logic ;
  zero_flag : out std_logic ;
  sign_flag : out std_logic
);
end entity ;

architecture gate_level of divider is
type reminders_array is array (0 to 4 ) of std_logic_vector( 3 downto 0 ) ;
begin
  avf_flag <= '0' ;
  sign_flag <= '0' ;
  process( clk )
    variable sc : integer := 4 ;
    variable w : reminders_array ;
    variable q : std_logic_vector( 3 downto 0 ) ;
  begin
    output <= q & w(4)( 7 downto 4 ) ;
    zero_flag <= not( q(0) or q(1) or q(2) or q(3) or w(4)(3) or w(4)(2) or w(4)(1) or w(4)(0) ) ;
    if( clk'event and clk = '1' ) then
      if( sc < 4 ) then
        w(sc) := w(sc) - b( 3 downto 0 ) ;
        if( w(sc) >= 0 )then
          w(sc+1) := w(sc) ;
          q( 3 - sc ) := '1' ;
        else
          w(sc+1) := w(sc) + b( 3 downto 0 ) ;
          q( 3 - sc ) := '0' ;
        end if ;
        sc := sc + 1 ;
      elsif( do = '1' )then
        sc := 0 ;
        w := ( others => "00000000" ) ;
        q :=  "0000"  ;
        w(0) := a(7 downto 0 ) ;
      end if ;
    end if ;
  end process ;
end architecture ;