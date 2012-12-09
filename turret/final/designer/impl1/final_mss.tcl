# Created by Libero Project Manager 9.1.0.18
# Fri Dec 07 13:47:01 2012

# (NEW DESIGN)

# create a new design
new_design -name "final_mss" -family "SmartFusion"
set_device -die "A2F200M3F" -package "484 FBGA"


# set default back-annotation base-name
set_defvar "BA_NAME" "final_mss_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\David\Desktop\final\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

# set working directory
set_defvar "DESDIR" "C:/Users/David/Desktop/final/designer/impl1"

# set back-annotation output directory
set_defvar "BA_DIR" "C:/Users/David/Desktop/final/designer/impl1"

# enable the export back-annotation netlist
set_defvar "BA_NETLIST_ALSO" "1"

# set EDIF options
set_defvar "EDNINFLAVOR" "GENERIC"

# set HDL options
set_defvar "NETLIST_NAMING_STYLE" "VERILOG"

# setup status report options
set_defvar "EXPORT_STATUS_REPORT" "1"
set_defvar "EXPORT_STATUS_REPORT_FILENAME" "final_mss.rpt"

# legacy audit-mode flags (left here for historical reasons)
set_defvar "AUDIT_NETLIST_FILE" "1"
set_defvar "AUDIT_DCF_FILE" "1"
set_defvar "AUDIT_PIN_FILE" "1"
set_defvar "AUDIT_ADL_FILE" "1"

# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/final_mss.edn} \
-format "pdc"  {..\..\component\work\final_mss\final_mss.pdc} \
-format "sdc"  {..\..\synthesis\final_mss_sdc.sdc}

# save the design database
save_design {final_mss_1.adb}

show_device_selection_wizard
