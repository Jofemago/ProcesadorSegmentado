
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY R4_tb IS
END R4_tb;
 
ARCHITECTURE behavior OF R4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R4
    PORT(
         Rin : IN  std_logic_vector(97 downto 0);
         rst : IN  std_logic;
         Rout : OUT  std_logic_vector(97 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rin : std_logic_vector(97 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Rout : std_logic_vector(97 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R4 PORT MAP (
          Rin => Rin,
          rst => rst,
          Rout => Rout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		

      Rin <= "11010010010000100010000000000000000000000000000000000000000000000000000000000000000000000000000000";
		rst <= '0';
		wait for 20 ns;
		rst <= '1'; 

      wait;
   end process;

END;
