# get the root directory
variable fpgaconvnet_root [file dirname [file dirname [file dirname [file normalize [info script]]]]]

# load getopt script
source ${fpgaconvnet_root}/scripts/hls/tcl_getopt.tcl

# get component path
if {![info exists ::env(PRJ)] || $::env(PRJ) eq ""} {
    error "env PRJ not set"
}
set project_path [file normalize $::env(PRJ)]

# ensure trailing slash
if {![string match "*/" $project_path]} {
    set project_path "${project_path}/"
}

# open component
open_component ${project_path}

# run export design
export_design -rtl verilog -format ip_catalog

exit