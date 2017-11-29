# Common settings
source "../my_scripts/common_settings.tcl"

# Placement
# Open lib and desigm
open_mw_lib $lib_name

copy_mw_cel	\
	-from_library $lib_name \
	-from "${cell_name}_clock_opt" \
	-to_library $lib_name \
	-to "${cell_name}_route_opt"

set ::auto_restore_mw_cel_lib_setup true
open_mw_cel  "${cell_name}_route_opt"
current_mw_cel "${cell_name}_route_opt"

# route timing settings
set_si_options -delta_delay true  \
               -route_xtalk_prevention true \
               -route_xtalk_prevention_threshold 0.25 \
	       -analysis_effort medium

set_si_options -min_delta_delay true

route_opt -initial_route_only 

save_mw_cel -as route_opt_icc_pre_rv_insertion 
insert_zrt_redundant_vias 
set_route_zrt_common_options -post_detail_route_redundant_via_insertion medium

source ../my_scripts/derive_pg.tcl

# route_opt
update_timing

route_opt -skip_initial_route -effort medium -xtalk_reduction

########################################
#   Additional route_opt practices
########################################
## To further improve QoR after the initial "route_opt -skip_initial" : 
#	route_opt -incremental

## For final overall optimization while limiting disturbances to the design :
#	route_opt -incremental -size_only

## For the G-2012.06 based recommended postroute design closure flow, 
#  refer to SolvNet #034130

## To use the scenario compression feature, try the following :
#	open_mw_cel, etc 
#	compress_scenario
#	route_opt -skip_initial_route -effort $ROUTE_OPT_EFFORT -xtalk_reduction -power
#	route_opt -incremental ;# more run time benefit when multiple route_opt commands are used
#	uncompress_scenario
#	route_opt -incremental -size_only ;# to recover final QoR

## To limit route_opt to specific optimizations :
#	route_opt -incremental -only_xtalk_reduction : only xtalk reduction 
#	route_opt -incremental -only_hold_time : only hold fixing 
#	route_opt -incremental -(only_)wire_size : runs wire sizing which fixes timing by applying NDR's from define_routing_rule

## To prioritize max tran fixing :
#  By default, route_opt prioritizes max delay cost over max design rule costs (e.g. max tran). 
#  To set higher priority for DRC fixing, set the following variable.
#  Note that this variable only works with the -only_design_rule option.
#  set_app_var routeopt_drc_over_timing true
#  	route_opt -incremental -only_design_rule

## To run size only but still allowing buffers to be inserted for hold fixing :
#  set_app_var routeopt_allow_min_buffer_with_size_only true
########################################

source ../my_scripts/derive_pg.tcl

save_mw_cel  -design "${cell_name}_route_opt.CEL;1"

