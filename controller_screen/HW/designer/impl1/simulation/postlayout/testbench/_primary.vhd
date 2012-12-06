library verilog;
use verilog.vl_types.all;
entity testbench is
    generic(
        SYSCLK_PERIOD   : integer := 100
    );
end testbench;
