```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fixed_counter is
  port (
    clk : in std_logic;
    rst : in std_logic;
    count_out : out integer range 0 to 15
  );
end entity;

architecture behavioral of fixed_counter is
  signal internal_count : integer range 0 to 15 := 0;
  signal count_out_reg : integer range 0 to 15 := 0;  -- Added register for output
begin
  process (clk, rst)
  begin
    if rst = '1' then
      internal_count <= 0;
    elsif rising_edge(clk) then
      if internal_count = 15 then
        internal_count <= 0;
      else
        internal_count <= internal_count + 1;
      end if;
    end if;
  end process;

  process (clk, rst)
  begin
    if rst = '1' then
      count_out_reg <= 0;
    elsif rising_edge(clk) then
      count_out_reg <= internal_count;   -- Updated in separate process
    end if;
  end process;

  count_out <= count_out_reg; 
end architecture;
```