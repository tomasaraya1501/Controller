--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:40:11 11/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Alumno_diee/Desktop/Arqui/Controller/testcontroller.vhd
-- Project Name:  Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testcontroller IS
END testcontroller;
 
ARCHITECTURE behavior OF testcontroller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
 
   constant <clock>_period : time := 10 ns;
 
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

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
