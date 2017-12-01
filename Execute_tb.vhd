
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Execute_tb IS
END Execute_tb;
 
ARCHITECTURE behavior OF Execute_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Execute
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         AluOP : IN  std_logic_vector(5 downto 0);
         --wrenmem : IN  std_logic;
         --outwrenmem : OUT  std_logic;
         --rfsource : IN  std_logic_vector(1 downto 0);
         --outrfsource : OUT  std_logic_vector(1 downto 0);
         --pc : IN  std_logic_vector(31 downto 0);
         --outpc : OUT  std_logic_vector(31 downto 0);
         nCWP : IN  std_logic_vector(4 downto 0);
         AluR : OUT  std_logic_vector(31 downto 0);
         --cRd : IN  std_logic_vector(31 downto 0);
         --outcRd : OUT  std_logic_vector(31 downto 0);
         CWP : OUT  std_logic_vector(4 downto 0);
         icc : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOP : std_logic_vector(5 downto 0) := (others => '0');
--   signal wrenmem : std_logic := '0';
--   signal rfsource : std_logic_vector(1 downto 0) := (others => '0');
--   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal nCWP : std_logic_vector(4 downto 0) := (others => '0');
--   signal cRd : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
--   signal outwrenmem : std_logic;
--   signal outrfsource : std_logic_vector(1 downto 0);
--   signal outpc : std_logic_vector(31 downto 0);
   signal AluR : std_logic_vector(31 downto 0);
--   signal outcRd : std_logic_vector(31 downto 0);
   signal CWP : std_logic_vector(4 downto 0);
   signal icc : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Execute PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          AluOP => AluOP,
--          wrenmem => wrenmem,
--          outwrenmem => outwrenmem,
--          rfsource => rfsource,
--          outrfsource => outrfsource,
--          pc => pc,
--          outpc => outpc,
          nCWP => nCWP,
          AluR => AluR,
--          cRd => cRd,
--          outcRd => outcRd,
          CWP => CWP,
          icc => icc,
          clk => clk,
          rst => rst
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Op1 <= "00000000000000000000000000000001";
		Op2 <= "00000000000000000000000000000010";
		AluOP <= "000000";
--		wrenmem <= '1';
--		rfsource <= "10";
--		pc <= "00000000000000000000000000000000";
		nCWP <= "00001";
		--cRd <= "00000000000000000000000000000011";
		rst <= '0';
		wait for clk_period;
		AluOP <= "000100";
--		wrenmem <= '0';
--		rfsource <= "11";
--		pc <= "00000000000000000000000000000001";
		--cRd <= "00000000000000000000000000000111";
		

      wait;
   end process;

END;
