-- Top level entity

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is 
	port (
			AUD_ADCDAT    : in    std_logic                    := '0';             --     audio.ADCDAT
			AUD_ADCLRCK   : in    std_logic                    := '0';             --          .ADCLRCK
			AUD_BCLK      : in    std_logic                    := '0';             --          .BCLK
			AUD_DACDAT    : out   std_logic;                                       --          .DACDAT
			AUD_DACLRCK   : in    std_logic                    := '0';             --          .DACLRCK
			AUD_XCK		  : out   std_logic;
			FPGA_I2C_SDAT : inout std_logic                    := '0';             -- av_config.SDAT
			FPGA_I2C_SCLK : out   std_logic;                                       --          .SCLK
			CLOCK_50      : in    std_logic                    := '0';             --       clk.clk
			KEY           : in    std_logic_vector(3 downto 0) := (others => '0'); --       key.export
			LEDR 	        : out   std_logic_vector(9 downto 0);
			SW            : in    std_logic_vector(9 downto 0) := (others => '0') 
			);
end top;


architecture rtl of top is 


	component nios_2_audio is
	port (
		audio_ADCDAT                   : in    std_logic                    := '0';             --                    audio.ADCDAT
		audio_ADCLRCK                  : in    std_logic                    := '0';             --                         .ADCLRCK
		audio_BCLK                     : in    std_logic                    := '0';             --                         .BCLK
		audio_DACDAT                   : out   std_logic;                                       --                         .DACDAT
		audio_DACLRCK                  : in    std_logic                    := '0';             --                         .DACLRCK
		audio_pll_1_audio_clk_clk      : out   std_logic;                                       --    audio_pll_1_audio_clk.clk
		audio_pll_1_reset_source_reset : out   std_logic;                                       -- audio_pll_1_reset_source.reset
		av_config_SDAT                 : inout std_logic                    := '0';             --                av_config.SDAT
		av_config_SCLK                 : out   std_logic;                                       --                         .SCLK
		clk_clk                        : in    std_logic                    := '0';             --                      clk.clk
		key_export                     : in    std_logic_vector(3 downto 0) := (others => '0'); --                      key.export
		led_export                     : out   std_logic_vector(9 downto 0);                    --                      led.export
		sw_export                      : in    std_logic_vector(9 downto 0) := (others => '0')  --                       sw.export
	);
	end component;

	signal PLL_RESET : std_logic := '0';
	
	
begin 
	nios_2_audio_0: nios_2_audio port map (AUD_ADCDAT, 
																  AUD_ADCLRCK, 
																  AUD_BCLK, 
																  AUD_DACDAT, 
																  AUD_DACLRCK,
																  AUD_XCK,
																  PLL_RESET,
																  FPGA_I2C_SDAT, 
																  FPGA_I2C_SCLK, 
																  CLOCK_50,
																  KEY,
																  LEDR,
																  SW
																 );

end rtl;


	
	
	
	
	
	