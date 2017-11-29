# Common settings
source "../my_scripts/common_settings.tcl"

#Create MW lib
create_mw_lib \
	 -technology $techfile	\
	 -mw_reference_library $ref_lib	\
	 -bus_naming_style {[%d]}	\
	 -hier_separator {/}	\
	 $lib_name

		
open_mw_lib $lib_name

import_designs	\
	 -format ddc \
	 -top $cell_name \
	 -cel $cell_name \
	 $design_data

save_mw_cel  -design "${cell_name}.CEL;1"

return

close_mw_cel
close_mw_lib
