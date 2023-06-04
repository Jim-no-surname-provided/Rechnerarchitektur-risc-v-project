library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity testbench is
end;


architecture bhv of testbench is
    component AND2
        port(a, b : in std_ulogic;
            y: out std_ulogic);
    end component;

    signal a, b, y: std_ulogic;
begin
  
  cra_comp: AND2 port map(a, b, y);
  
  process begin
      a <= '1';
      b <= '0';
      wait for 40 ns;
      report "1 AND 0 = " & std_ulogic'image(y);
  
      a <= '1';
      b <= '1';
      wait for 40 ns;
      report "1 AND 1 = " & std_ulogic'image(y);
      report "Test done.";
      wait;
  end process;
end;
