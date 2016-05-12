library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all ;

entity logic_unit is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  and_controller : in std_logic ;
  or_controller : in std_logic ;
  shift_to_left_controller : in std_logic ;
  shift_to_right_controller : in std_logic ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end entity ;

architecture gate_level of logic_unit is 
signal temp_in : std_logic_vector( 7 downto 0 ) ;
signal temp_out : std_logic_vector( 7 downto 0 ) ;

component and_maker is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end component ;

component or_maker is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  b : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end component ;

component shift_to_left is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end component ;

component shift_to_right is port(
  a : in std_logic_vector( 7 downto 0 ) ;
  output : out std_logic_vector( 7 downto 0 ) ;
  zero_flag : out std_logic;
  carry_flag : out std_logic ;
  sign_flag : out std_logic
  );
end component ;

signal and_output : std_logic_vector( 7 downto 0 ) ;
signal or_output : std_logic_vector( 7 downto 0 ) ;
signal shift_to_left_output : std_logic_vector( 7 downto 0 ) ;
signal shift_to_right_output : std_logic_vector( 7 downto 0 ) ;
begin
  
end architecture ;



