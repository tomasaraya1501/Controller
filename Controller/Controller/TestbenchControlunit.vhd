LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY TestbenchControlunit IS
END TestbenchControlunit;
 
ARCHITECTURE behavior OF TestbenchControlunit IS 
 
 
    COMPONENT controller
    PORT(
         op : IN  std_logic_vector(5 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         zero : IN  std_logic;
         memtoreg : OUT  std_logic;
         memwrite : OUT  std_logic;
         pcsrc : OUT  std_logic;
         alusrc : OUT  std_logic;
         regdst : OUT  std_logic;
         regwrite : OUT  std_logic;
         jump : OUT  std_logic;
         alucontrol : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');
   signal funct : std_logic_vector(5 downto 0) := (others => '0');
   signal zero : std_logic := '0';

 	--Outputs
   signal memtoreg : std_logic;
   signal memwrite : std_logic;
   signal pcsrc : std_logic;
   signal alusrc : std_logic;
   signal regdst : std_logic;
   signal regwrite : std_logic;
   signal jump : std_logic;
   signal alucontrol : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          op => op,
          funct => funct,
          zero => zero,
          memtoreg => memtoreg,
          memwrite => memwrite,
          pcsrc => pcsrc,
          alusrc => alusrc,
          regdst => regdst,
          regwrite => regwrite,
          jump => jump,
          alucontrol => alucontrol
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

     op <= "000000";-- Rtype

      wait for 20 ns;
		
		zero <= '1';

      wait for 30 ns;
		
		funct <= "100000";--operation add, aluop is 010
		
		wait for 40 ns;
		
		funct <= "100100";--operation and, aluop is 000
		
		wait for 50 ns;
		
		op <= "100011";-- LW
		
		wait for 60 ns;
		
		funct <= "100000";
				
		wait for 70 ns;
		
		op <= "101011";-- SW
		
		wait for 80 ns;
		
		op <= "000100";-- BEQ
		
		wait for 90 ns;
		
		funct <= "100010";--sub
		
		wait for 100 ns;	
		
		op <= "001000";--ADDI
		
		wait for 110 ns;
				
		funct <= "100000";--add
		
		wait for 110 ns;
		
		op <= "000010";--J
		
		wait for 120 ns;
		
		zero <= '0';
		
		wait for 130 ns;

   end process;

END;
