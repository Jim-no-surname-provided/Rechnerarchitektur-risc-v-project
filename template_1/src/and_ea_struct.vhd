library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND2 is
    port(a, b: std_ulogic; 
         y: out std_ulogic);
end;

architecture struct of AND2 is
begin
    y <= a and b;
end;

