
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY WriteBack_tb IS
END WriteBack_tb;
 
ARCHITECTURE behavior OF WriteBack_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WriteBack
    PORT(
         pc : IN  std_logic_vector(31 downto 0);
         datatomem : IN  std_logic_vector(31 downto 0);
         aluads : IN  std_logic_vector(31 downto 0);
         rfsource : IN  std_logic_vector(1 downto 0);
         datatores : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal datatomem : std_logic_vector(31 downto 0) := (others => '0');
   signal aluads : std_logic_vector(31 downto 0) := (others => '0');
   signal rfsource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal datatores : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WriteBack PORT MAP (
          pc => pc,
          datatomem => datatomem,
          aluads => aluads,
          rfsource => rfsource,
          datatores => datatores
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		datatomem <="00000000000000000000000000000001";
      aluads <="00000000000000000000000000000010";
      pc <="00000000000000000000000000000011";
		RFsource <="00";
      wait for 10 ns;
			 RFsource <="01";
		wait for 10 ns;
			 RFsource <="10";
		wait for 10 ns;
			 RFsource <="11";
		wait for 10 ns;
			 RFsource <="00";
      wait for 100 ns;	



      -- insert stimulus here 

      wait;
   end process;

END;
