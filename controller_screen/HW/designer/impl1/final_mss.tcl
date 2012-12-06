# Created by Libero Project Manager 9.1.5.1
# Tue Nov 20 16:25:05 2012

# (OPEN DESIGN)

open_design "final_mss.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "final_mss_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\thinkpad\SkyDrive\eecs373final\final\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

# create back-annotate files
backannotate -name "final_mss_ba" -format "SDF" -language "VERILOG" -netlist

save_design