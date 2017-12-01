
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY InstructionFetch_tb IS
END InstructionFetch_tb;
 
ARCHITECTURE behavior OF InstructionFetch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionFetch
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         npc : IN  std_logic_vector(31 downto 0);
         instructionM : OUT  std_logic_vector(31 downto 0);
         outSumador : OUT  std_logic_vector(31 downto 0);
			 pcO: out std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal npc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instructionM : std_logic_vector(31 downto 0);
   signal outSumador : std_logic_vector(31 downto 0);
	signal pcO: std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionFetch PORT MAP (
          clk => clk,
          rst => rst,
          npc => npc,
          instructionM => instructionM,
          outSumador => outSumador,
			 pcO => pcO
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
      npc <= "00000000000000000000000000000000";
		wait for clk_period;
		npc <= "00000000000000000000000000000001";
		wait for clk_period;
		npc <= "00000000000000000000000000000010";
		

      wait;
   end process;

END;
