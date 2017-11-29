# Common settings
source "../my_scripts/common_settings.tcl"

# Placement
# Open lib and desigm
open_mw_lib $lib_name

copy_mw_cel	\
	-from_library $lib_name \
	-from "${cell_name}_floorplan" \
	-to_library $lib_name \
	-to "${cell_name}_place_opt"

set ::auto_restore_mw_cel_lib_setup true
open_mw_cel  "${cell_name}_place_opt"
current_mw_cel "${cell_name}_place_opt"

set_ignored_layers -max_routing_layer M7 -min_routing_layer M4

set_ideal_network [all_fanout -flat -clock_tree ]

set_separate_process_options -placement false

place_opt -area_recovery -effort high -continue_on_missing_scandef

refine_placement -congestion_effort high -continue_on_missing_scandef -perturbation_level medium

preroute_focal_opt -layer_optimization

source ../my_scripts/derive_pg.tcl

save_mw_cel  -design "${cell_name}_place_opt.CEL;1"

