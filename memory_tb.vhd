
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memory_tb IS
END memory_tb;
 
ARCHITECTURE behavior OF memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    PORT(
         we : IN  std_logic;
--         pc : IN  std_logic_vector(31 downto 0);
--         pcO : OUT  std_logic_vector(31 downto 0);
         address : IN  std_logic_vector(31 downto 0);
--         addressO : OUT  std_logic_vector(31 downto 0);
         crd : IN  std_logic_vector(31 downto 0);
--         rfsource : IN  std_logic_vector(1 downto 0);
--         rfsourceO : OUT  std_logic_vector(1 downto 0);
         Datatomem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal we : std_logic := '0';
--   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
--   signal rfsource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
--   signal pcO : std_logic_vector(31 downto 0);
--   signal addressO : std_logic_vector(31 downto 0);
--   signal rfsourceO : std_logic_vector(1 downto 0);
   signal Datatomem : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          we => we,
--          pc => pc,
--          pcO => pcO,
          address => address,
--          addressO => addressO,
          crd => crd,
--          rfsource => rfsource,
--          rfsourceO => rfsourceO,
          Datatomem => Datatomem
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		we<='1';
		--pc<="00000000000000000000000000000001";
		address<="00000000000000000000000000000001";
		crd<="00000000000000000000000000000010";
		--rfsource<="01";
      wait for 10 ns;
		we<='1';
		--pc<="00000000000000000000000000000010";
		address<="00000000000000000000000000000010";
		crd<="00000000000000000000000000000011";
--		rfsource<="01";
		wait for 10 ns;
		we<='0';
--		pc<="00000000000000000000000000000011";
		address<="00000000000000000000000000000001";
		crd<="00000000000000000000000000000011";
--		rfsource<="01";



      -- insert stimulus here 

      wait;
   end process;

END;
