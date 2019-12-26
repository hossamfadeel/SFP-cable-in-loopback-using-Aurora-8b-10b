----------------------------------------------------------------------------------
-- Company: Trenz Electronic GmbH
-- Engineer: Antti Lukats 
-- 
-- Create Date: 13.11.2013 09:58:03
-- Design Name: 
-- Module Name: SC0841 - Behavioral
-- Project Name: 
-- Target Devices: TE0841 SoM
-- Tool Versions: 2016.1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.1  
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SC0808BF is 
    Generic (
      C_PCB_REV     : integer range 0 to 0          := 0; -- 0 REV 01
      
     
      C_GENERIC  : integer range 0 to 3          := 1
    );
    Port ( 
       PS_AUX_DI   : out  std_logic;
       PS_AUX_DO   : in  std_logic;
       PS_AUX_OE   : in  std_logic;
       PS_HPD   : out  std_logic;

	   -- LED        : in  std_logic;
	   
	   -- Slave CPLD
	   SC5        : in  std_logic;  -- RGPIO RXD
	   SC6        : out  std_logic; -- RGPIO Clock
	   SC7        : out  std_logic; -- RGPIO TXD
	   
	   -- Master CPLD
	   SC10_I     : in  std_logic;  -- AUX IO 
	   SC10_O     : out  std_logic;  -- 
	   SC10_T     : out  std_logic;  -- 
	   SC11       : out  std_logic;  -- AUX DIR
	   SC12       : in  std_logic;  -- HPD
	   
	   
	   SC13        : in  std_logic;  -- RGPIO RXD
       SC15        : out  std_logic; -- RGPIO Clock
       SC14        : out  std_logic; -- RGPIO TXD
	   
	   
	   -------------------------------------------
	   
	   MASTER_RGPIO_O        : out  std_logic_vector(31 downto 0); --
	   SLAVE_RGPIO_O        : out  std_logic_vector(31 downto 0); --
	   MASTER_RGPIO_I        : in  std_logic_vector(31 downto 0); --
     SLAVE_RGPIO_I        : in  std_logic_vector(31 downto 0); --	    
	   --
	   
    sys_clock   : in  std_logic;  -- 
	   sys_resetn  : in  std_logic;  -- 
	   	   
	   MASTER_RGPIO_ACTIVE      : out std_logic;
	   SLAVE_RGPIO_ACTIVE      : out std_logic
	);

	
	
end SC0808BF;

architecture Behavioral of SC0808BF is

-- signal LED_i: std_logic := '0';

signal rgpio_clk : std_logic; 		
signal rgpio_txd : std_logic; 		
signal rgpio_rxd : std_logic; 		

signal rgpio_out : std_logic_vector(31 downto 0); 		
signal rgpio_in : std_logic_vector(31 downto 0); 		

signal rgpio_active : std_logic; 		

signal rgpio2_clk : std_logic; 		
signal rgpio2_txd : std_logic; 		
signal rgpio2_rxd : std_logic; 		

signal rgpio2_out : std_logic_vector(31 downto 0); 		
signal rgpio2_in : std_logic_vector(31 downto 0); 		

signal rgpio2_active : std_logic; 		



begin

       PS_AUX_DI  <= SC10_I;
       SC10_O     <= PS_AUX_DO;
       SC10_T     <= PS_AUX_OE;     -- Enable as output when input OE = Low
       SC11       <= not PS_AUX_OE;
        
       PS_HPD <= SC12; -- change to RGPIO ?

--
-- Master CPLD
--


    SC15         <= rgpio_clk;
    rgpio_rxd  <= SC13;
    SC14         <= rgpio_txd;


i_ddrspi_SC: entity work.ddrspi_master port map ( 
		   clk           => sys_clock,
		   resetn        => sys_resetn,
		    
		   
           data_in        => rgpio_in,
           data_out       => rgpio_out,
           
           ready          => open,
		   valid          => open,
           
           TX_CLK      	=> rgpio_clk,
           RX_DATA      => rgpio_rxd,
           TX_DATA      => rgpio_txd

    );

--
-- Slave CPLD
--
    SC6         <= rgpio2_clk;
    rgpio2_rxd  <= SC5;
    SC7         <= rgpio2_txd;

i_ddrspi_SC2: entity work.ddrspi_master port map ( 
		   clk           => sys_clock,
		   resetn        => sys_resetn,
		    
		   
           data_in        => rgpio2_in,
           data_out       => rgpio2_out,
           
           ready          => open,
		   valid          => open,
           
           TX_CLK      	=> rgpio2_clk,
           RX_DATA      => rgpio2_rxd,
           TX_DATA      => rgpio2_txd

    );

   MASTER_RGPIO_O <= rgpio_out;
   SLAVE_RGPIO_O <= rgpio2_out;
   rgpio_in <= MASTER_RGPIO_I;
   rgpio2_in <= SLAVE_RGPIO_I;	    



--
-- LED Config
--

--LED_CFG_0: if C_LED_CFG = 0 generate
--    LED_i <= '0';
--end generate LED_CFG_0;   

    MASTER_RGPIO_ACTIVE <= '1' when (rgpio_in(31 downto 28)="1010" and rgpio_out(31 downto 28)="1010") else '0';    
    SLAVE_RGPIO_ACTIVE <= '1' when (rgpio2_in(31 downto 28)="1010" and rgpio2_out(31 downto 28)="1010") else '0';    

end Behavioral;
