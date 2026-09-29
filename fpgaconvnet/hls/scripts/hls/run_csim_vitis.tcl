# get the root directory
variable fpgaconvnet_root [file dirname [file dirname [file dirname [file normalize [info script]]]]]

# load getopt script
source ${fpgaconvnet_root}/scripts/hls/tcl_getopt.tcl

# get component path
if {![info exists ::env(PRJ)] || $::env(PRJ) eq ""} {
    error "env PRJ not set"
}
set project_path [file normalize $::env(PRJ)]

# set path again
set default_cflags "-std=c++14 -fexceptions -DHLSLIB_SYNTHESIS \
  -I${project_path}/include -I${project_path}/data \
  -I${fpgaconvnet_root}/hardware -I${fpgaconvnet_root}/hardware/hlslib/include"
set default_csimflags "-I${project_path}/include"

# ensure trailing slash
if {![string match "*/" $project_path]} {
    set project_path "${project_path}/"
}

# open component
open_component ${project_path}

# absolute route for tb files
add_files [glob -nocomplain [file join $project_path src *.cpp]] -cflags "${default_cflags}" -csimflags "${default_csimflags}"
add_files -tb [glob -nocomplain [file join $project_path tb *.cpp]] -cflags "${default_cflags}"
add_files -tb [glob -nocomplain [file join $project_path data *.dat]]

# open solution
#cd $project_path
#open_solution solution

# run c-simulation
csim_design

exit
