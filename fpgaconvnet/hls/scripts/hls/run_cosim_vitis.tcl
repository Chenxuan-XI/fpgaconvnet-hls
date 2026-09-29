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

# absolute route for tb files
add_files -tb [glob -nocomplain [file join $project_path data *.dat]]

# run co-simulation
cosim_design -rtl verilog -trace_level all

exit