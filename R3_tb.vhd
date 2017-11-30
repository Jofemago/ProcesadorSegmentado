
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY R3_tb IS
END R3_tb;
 
ARCHITECTURE behavior OF R3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R3
    PORT(
         Rin : IN  std_logic_vector(98 downto 0);
         rst : IN  std_logic;
         Rout : OUT  std_logic_vector(98 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rin : std_logic_vector(98 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Rout : std_logic_vector(98 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R3 PORT MAP (
          Rin => Rin,
          rst => rst,
          Rout => Rout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
      Rin <= "110100100100001000100000000000000000000000000000000000000000000000000000000000000000000000000000000";
		rst <= '0';
		wait for 20 ns;
		rst <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
