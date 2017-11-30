
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY InstructionDecode_tb IS
END InstructionDecode_tb;
 
ARCHITECTURE behavior OF InstructionDecode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionDecode
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(4 downto 0);
         rfdest : IN  std_logic;
         imm13 : IN  std_logic_vector(12 downto 0);
         i : IN  std_logic;
         we : IN  std_logic;
         dtowrite : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         ncwp : OUT  std_logic_vector(4 downto 0);
         op2_crs2 : OUT  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(4 downto 0) := (others => '0');
   signal rfdest : std_logic := '0';
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');
   signal i : std_logic := '0';
   signal we : std_logic := '0';
   signal dtowrite : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal ncwp : std_logic_vector(4 downto 0);
   signal op2_crs2 : std_logic_vector(31 downto 0);
   signal crs1 : std_logic_vector(31 downto 0);
   signal crd : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionDecode PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          rfdest => rfdest,
          imm13 => imm13,
          i => i,
          we => we,
          dtowrite => dtowrite,
          rst => rst,
          ncwp => ncwp,
          op2_crs2 => op2_crs2,
          crs1 => crs1,
          crd => crd
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		 rs1 <= "01000";
		 rs2 <= "00001";
		 rd  <= "00010";
		 op <= "00";
		 op3 <= "000000";
		 cwp <= "00000";
		 rfdest <= '0';
		 imm13 <= "0101010101010";
		 i<= '0';
		 we <= '1';
		 dtowrite <= "00000000000000000000000001010011";
		 rst <= '0';
      wait for 10 ns;
		
		
		rs1 <= "01000";
		 rs2 <= "00001";
		 rd  <= "00010";
		 op <= "00";
		 op3 <= "000000";
		 cwp <= "00000";
		 rfdest <= '0';
		 imm13 <= "0101010101010";
		 i<= '0';
		 we <= '0';
		 dtowrite <= "00000000000000000000000001111111";
		 rst <= '0';
      wait for 10 ns;

		
		
--		 rs1 <= "00000";
--		 rs2 <= "00001";
--		 rd  <= "00010";
--		 op <= "00";
--		 op3 <= "000000";
--		 cwp <= "00000";
--		 rfdest <= '1';
--		 imm13 <= "0101010101010";
--		 i<= '0';
--		 we <= '1';
--		 dtowrite <= "00000101000000010100000001010011";
--		 rst <= '0';

--	wait for 10 ns;	 
--		 wait for 5 ns;
--		we <= '0';
--		 wait for 5 ns;			 
--		
--		 rs1 <= "00000";
--		 rs2 <= "00001";
--		 rd  <= "00100";
--		 op <= "00";
--		 op3 <= "000000";
--		 cwp <= "00000";
--		 rfdest <= '0';
--		 imm13 <= "0101010101010";
--		 i<= '0';
--		 we <= '1';
--		 dtowrite <= "00000101000000010100000001010011";
		 --rst <= '0';
		 
		 
--         rs1 : IN  std_logic_vector(4 downto 0);
--         rs2 : IN  std_logic_vector(4 downto 0);
--         rd : IN  std_logic_vector(4 downto 0);
--         op : IN  std_logic_vector(1 downto 0);
--         op3 : IN  std_logic_vector(5 downto 0);
--         cwp : IN  std_logic_vector(4 downto 0);
--         rfdest : IN  std_logic;
--         imm13 : IN  std_logic_vector(12 downto 0);
--         i : IN  std_logic;
--         we : IN  std_logic;
--         dtowrite : IN  std_logic_vector(31 downto 0);
--         rst : IN  std_logic;

	
      -- insert stimulus here 
		
      wait;
   end process;

END;
