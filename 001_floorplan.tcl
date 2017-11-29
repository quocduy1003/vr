# Common settings
source "../my_scripts/common_settings.tcl"

# Floorplaning 
# Open lib and design
open_mw_lib $lib_name

copy_mw_cel	\
	-from_library $lib_name \
	-from $cell_name \
	-to_library $lib_name \
	-to "${cell_name}_floorplan"

set ::auto_restore_mw_cel_lib_setup true
open_mw_cel  "${cell_name}_floorplan"
current_mw_cel "${cell_name}_floorplan"

# Create PG, IO pad

source -e -v ../my_scripts/pad_constraint.tcl
 
derive_pg_connection 	\
	-power_net VDD	\
	-power_pin VDD	\
	-ground_net VSS	\
	-ground_pin VSS -create_port top

derive_pg_connection 	\
	-power_net VDD	\
	-power_pin VDD	\
	-ground_net VSS	\
	-ground_pin VSS -tie

derive_pg_connection 	 \
	-power_net VDD	 \
	-power_pin VDDIO \
	-ground_net VSS	 \
	-ground_pin VSSIO  -create_port top

derive_pg_connection 	 \
	-power_net VDD	 \
	-power_pin VDDIO \
	-ground_net VSS	 \
	-ground_pin VSSIO -tie

create_floorplan \
        -control_type aspect_ratio \
        -core_aspect_ratio 1 \
        -core_utilization 0.7 \
        -left_io2core 10 \
        -bottom_io2core 10 \
        -right_io2core 10 \
        -top_io2core 10 \
        -start_first_row  



create_fp_placement -effort High -congestion_driven -no_hierarchy_gravity

set_dont_touch_placement [all_macro_cells]

synthesize_fp_rail  -nets {VDD VSS} -synthesize_power_plan -power_budget 1000 \
	-pad_masters { VDD:VDD.FRAM VSS:VSS.FRAM VSS:IOVSS.FRAM VDD:IOVDD.FRAM }
# synthesize_fp_rail  -nets {VSS VDD} -synthesize_power_plan -power_budget 1000 \
#	-use_pins_as_pads -use_strap_ends_as_pads -ignore_blockages
commit_fp_rail

preroute_standard_cells	\
	 -connect horizontal	\
	 -port_filter_mode off	\
	 -cell_master_filter_mode off	\
	 -cell_instance_filter_mode off	\
	 -voltage_area_filter_mode off
	 
preroute_instances	\
	-ignore_pads -ignore_cover_cells

source ../my_scripts/derive_pg.tcl
	
verify_pg_nets


save_mw_cel  -design "${cell_name}_floorplan.CEL;1"

return

close_mw_cel

close_mw_lib
#end of floorplan
