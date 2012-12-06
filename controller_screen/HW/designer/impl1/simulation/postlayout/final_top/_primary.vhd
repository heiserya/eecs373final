library verilog;
use verilog.vl_types.all;
entity final_top is
    port(
        MSS_RESET_N     : in     vl_logic;
        GPIO_0_BI       : inout  vl_logic;
        pin             : out    vl_logic;
        clk1us          : out    vl_logic;
        clk4us          : out    vl_logic
    );
end final_top;
