-- VHDL module instantiation generated by SCUBA Diamond (64-bit) 3.12.0.240.2
-- Module  Version: 5.7
-- Thu Feb 17 15:28:57 2022

-- parameterized module component declaration
component pll1
    port (CLKI: in  std_logic; CLKOP: out  std_logic; 
        CLKOS: out  std_logic; CLKOS2: out  std_logic; 
        LOCK: out  std_logic);
end component;

-- parameterized module component instance
__ : pll1
    port map (CLKI=>__, CLKOP=>__, CLKOS=>__, CLKOS2=>__, LOCK=>__);
