
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY control_tb IS
END control_tb;
 
ARCHITECTURE behavior OF control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         pcIN : IN  std_logic_vector(31 downto 0);
         npcIN : IN  std_logic_vector(31 downto 0);
         iccIN : IN  std_logic_vector(3 downto 0);
         instruction : IN  std_logic_vector(31 downto 0);
         aluResultIN : IN  std_logic_vector(31 downto 0);
         rfDestOUT : OUT  std_logic;
         rfSourceOUT : OUT  std_logic_vector(1 downto 0);
         wrEnMemOUT : OUT  std_logic;
         wrEnRegisOUT : OUT  std_logic;
         aluOpOUT : OUT  std_logic_vector(5 downto 0);
         npcOUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pcIN : std_logic_vector(31 downto 0) := (others => '0');
   signal npcIN : std_logic_vector(31 downto 0) := (others => '0');
   signal iccIN : std_logic_vector(3 downto 0) := (others => '0');
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal aluResultIN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rfDestOUT : std_logic;
   signal rfSourceOUT : std_logic_vector(1 downto 0);
   signal wrEnMemOUT : std_logic;
   signal wrEnRegisOUT : std_logic;
   signal aluOpOUT : std_logic_vector(5 downto 0);
   signal npcOUT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          pcIN => pcIN,
          npcIN => npcIN,
          iccIN => iccIN,
          instruction => instruction,
          aluResultIN => aluResultIN,
          rfDestOUT => rfDestOUT,
          rfSourceOUT => rfSourceOUT,
          wrEnMemOUT => wrEnMemOUT,
          wrEnRegisOUT => wrEnRegisOUT,
          aluOpOUT => aluOpOUT,
          npcOUT => npcOUT
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		pcIN<="00000000000000000000000000000001";
		npcIN<="00000000000000000000000000000010";
		iccIN<="1111";
		instruction<="10100010000100000010000000000101";
		aluResultIN<="00000000000000000000000000000001";
		
      wait for 10 ns;	
		pcIN<="00000000000000000000000000000010";
		npcIN<="00000000000000000000000000000011";
		iccIN<="1111";
		instruction<="10100010000100000010000000000111";
		aluResultIN<="00000000000000000000000000000010";
		
		      wait for 10 ns;	
		pcIN<="00000000000000000000000000000011";
		npcIN<="00000000000000000000000000000100";
		iccIN<="1111";
		instruction<="10000000101001000110000000000000";
		aluResultIN<="00000000000000000000000000000010";
		
      wait for 10 ns;	
		pcIN<="00000000000000000000000000000100";
		npcIN<="00000000000000000000000000000101";
		iccIN<="0000";
		instruction<="00000010100000000000000000000100";
		aluResultIN<="00000000000000000000000000000010";
		
		wait for 10 ns;
		pcIN<="00000000000000000000000000000101";
		npcIN<="00000000000000000000000000000110";
		instruction<="01000000000000000000000000000100";
		aluResultIN<="00000000000000000000000000011111";
		
		wait for 10 ns;
		pcIN<="00000000000000000000000000000110";
		npcIN<="00000000000000000000000000000111";
		instruction<="00010000100000000000000000001011";
		aluResultIN<="00000000000000000000000000011011";
		
		wait for 10 ns;
		pcIN<="00000000000000000000000000000111";
		npcIN<="00000000000000000000000000001000";
		instruction<="10000001110000111110000000000001";
		aluResultIN<="00000000000000000000000000011010";
		
		
		
		
		
		



      -- insert stimulus here 

      wait;
   end process;

END;
