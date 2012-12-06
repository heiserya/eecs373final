quietly set ACTELLIBNAME smartfusion
quietly set PROJECT_DIR "C:/Users/thinkpad/SkyDrive/eecs373final/final"
source "${PROJECT_DIR}/simulation/CompileDssBfm.tcl";

if {[file exists ../designer/impl1/simulation/postlayout/_info]} {
   echo "INFO: Simulation library ../designer/impl1/simulation/postlayout already exists"
} else {
   vlib ../designer/impl1/simulation/postlayout
}
vmap postlayout ../designer/impl1/simulation/postlayout
vmap smartfusion "C:/Actel/Libero_v9.1/Designer/lib/modelsim/precompiled/vlog/smartfusion"
vmap MSSLIB "C:/Actel/Libero_v9.1/Designer/lib/modelsim/precompiled/mixed/smartfusion/MSSLIB"
vmap MSS_BFM_LIB "../component/Actel/SmartFusionMSS/MSS/2.5.106/mti/user_verilog/MSS_BFM_LIB"
vcom -work MSS_BFM_LIB -refresh
vlog -work MSS_BFM_LIB -refresh

vlog -work postlayout "${PROJECT_DIR}/designer/impl1/final_top_ba.v"
vlog "+incdir+${PROJECT_DIR}/component/work/final_top" -work postlayout "${PROJECT_DIR}/component/work/final_top/testbench.v"

vsim -L work -L MSSLIB -L smartfusion -L postlayout -L MSS_BFM_LIB  -t 1ps -sdfmax /final_top_0=${PROJECT_DIR}/designer/impl1/final_top_ba.sdf postlayout.testbench
add wave /testbench/*
run 1000ns
