# Common settings
source "../my_scripts/common_settings.tcl"

# Placement
# Open lib and desigm
open_mw_lib $lib_name

copy_mw_cel	\
	-from_library $lib_name \
	-from "${cell_name}_place_opt" \
	-to_library $lib_name \
	-to "${cell_name}_clock_opt"

set ::auto_restore_mw_cel_lib_setup true
open_mw_cel  "${cell_name}_clock_opt"
current_mw_cel "${cell_name}_clock_opt"

define_routing_rule NDR_double_spacing -default_reference_rule -multiplier_spacing 2
set_clock_tree_options -routing_rule NDR_double_spacing -use_default_routing_for_sinks 1 

set_clock_tree_options -layer_list {M3 M4 M5}

# clock_opt only_cts

clock_opt -only_cts -no_clock_route -continue_on_missing_scandef 

source ../my_scripts/derive_pg.tcl

remove_ideal_network [all_fanout -flat -clock_tree]

# clock_opt only_psyn

set_fix_hold [all_clocks]
set_fix_hold_options -preferred_buffer

set_app_var timing_remove_clock_reconvergence_pessimism true 

clock_opt -no_clock_route -only_psyn -area_recovery -continue_on_missing_scandef 

route_zrt_group -all_clock_nets -reuse_existing_global_route true -stop_after_global_route true

preroute_focal_opt -layer_optimization

source ../my_scripts/derive_pg.tcl

# clock_opt route

set_si_options -delta_delay false -min_delta_delay false -route_xtalk_prevention false

route_zrt_group -all_clock_nets -reuse_existing_global_route true

optimize_clock_tree -routed_clock_stage detail

source ../my_scripts/derive_pg.tcl

## For additional psynopt after clock nets are routed, try the following :
#extract_rc -force
#update_timing
#set_dont_touch_placement [get_cells -of [get_flat_pins [all_fanout -flat -from [get_attribute [get_clocks *] sources]] -filter pin_on_clock_network==true]]
#set psynopt_cmd "psynopt -area_recovery"
#if {$POWER_OPTIMIZATION} {lappend psynopt_cmd -power}
#echo $psynopt_cmd
#eval $psynopt_cmd  

save_mw_cel  -design "${cell_name}_clock_opt.CEL;1"

