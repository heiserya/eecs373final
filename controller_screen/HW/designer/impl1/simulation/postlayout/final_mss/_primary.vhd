library verilog;
use verilog.vl_types.all;
entity final_mss is
    port(
        FAB_CLK         : out    vl_logic;
        M2F_RESET_N     : out    vl_logic;
        MSS_RESET_N     : in     vl_logic
    );
end final_mss;
