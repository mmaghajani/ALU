library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity subtractor is port (
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  avf_flag : out std_logic ;
  zero_flag : out std_logic ;
  sign_flag : out std_logic 
  );
end entity ;

architecture gate_level of subtractor is
signal temp_bout : std_logic ;
signal temp_output : std_logic_vector( 7 downto 0 ) ;
signal temp_avf_flag : std_logic ;

component borrow_look_ahead_subtractor is port (
  a : in std_logic_vector( 3 downto 0 ) ;
  b : in std_logic_vector( 3 downto 0 ) ;
  bin : in std_logic ;
  subtract : out std_logic_vector( 3 downto 0 ) ;
  bout : out std_logic
);
end component ;

begin
  look_ahead1 : borrow_look_ahead_subtractor port map ( a( 3 downto 0 ) , b( 3 downto 0 ) , '0' , temp_output( 3 downto 0 )
    , temp_bout ) ;
  look_ahead2 : borrow_look_ahead_subtractor port map ( a( 7 downto 4 ) , b( 7 downto 4 ) , temp_bout , temp_output( 7 downto 4 ) ,
    temp_avf_flag ) ;
    
  sign_flag <=  temp_avf_flag;
  avf_flag <= temp_avf_flag ;
  output <= temp_output ;
  
  zero_flag <= not( temp_output(0) or temp_output(1) or temp_output(2) or temp_output(3) or temp_output(4) or
   temp_output(5) or temp_output(6) or temp_output(7) ) ;
end architecture ;


