
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY R1_tb IS
END R1_tb;
 
ARCHITECTURE behavior OF R1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R1
    PORT(
         Rin : IN  std_logic_vector(74 downto 0);
         rst : IN  std_logic;
         Rout : OUT  std_logic_vector(74 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rin : std_logic_vector(74 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Rout : std_logic_vector(74 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R1 PORT MAP (
          Rin => Rin,
          rst => rst,
          Rout => Rout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      Rin <= "000000000000001000000000000010000000000110000000000000100000000000000000110";
		rst <= '0';
		wait for 20 ns;
		rst <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
