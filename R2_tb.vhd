
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY R2_tb IS
END R2_tb;
 
ARCHITECTURE behavior OF R2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R2
    PORT(
         Rin : IN  std_logic_vector(141 downto 0);
         Rout : OUT  std_logic_vector(141 downto 0);
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rin : std_logic_vector(141 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Rout : std_logic_vector(141 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R2 PORT MAP (
          Rin => Rin,
          Rout => Rout,
          rst => rst
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
      Rin <= "1111111110010101100000000010000000000000000001000010001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
		rst <= '0';
		wait for 20 ns;
		rst <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
