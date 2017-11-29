set techfile	"../ref/techfiles/saed90nm_icc_1p9m.tf"
set ref_lib	"../ref/saed90nm ../ref/saed90nm_dv \
	../ref/saed_io_fr ../ref/saed_io_fc_fr ../ref/saed_io_fc_dv \
	../ref/saed_sram_fr ../ref/saed_sram_dv"
# set ref_lib	"../ref/saed90nm ../ref/saed_io_fr ../ref/saed_sram_fr "
set lib_name	"my_mw_lib"
set tlupmax	"../ref/starrcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus"
set tlupmin	"../ref/starrcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus"
set tech2itf	"../ref/starrcxt/tech2itf.map"
set_tlu_plus_files \
	-max_tluplus $tlupmax	\
	-min_tluplus $tlupmin	\
	-tech2itf_map  $tech2itf

set design_data	"../design_data/vr.mapped.ddc"
set cell_name "vr"

# Tell ICC where to look for files
set search_path "../ref/models ../ref/clf"
set target_library "{../ref/models/saed90nm_min.db}"
#set link_library "* {../ref/models/saed90nm_min.db} {../ref/models/saed90nm_io_min.db} \
#	 {../ref/models/SRAM32x512_1rw_min.db}"
set link_library "* {../ref/models/saed90nm_min.db} \
	{../ref/models/saed90nm_io_min_pg.db} {../ref/models/saed90nm_io_min.db} \
	{../ref/models/saed90nm_io_min_fc.db} {../ref/models/saed90nm_io_min_fc_pg.db} \
	{../ref/models/SRAM32x512_1rw_min.db} {../ref/models/SRAM32x512_1rw_min_pg.db}"

# Suppress some warnings
suppress_message {DDB-81 MWDC-287 MWDC-284}
suppress_message {PSYN-025 PSYN-058 PSYN-200}
suppress_message {LINT-33 LINT-32 LINT-28 LINT-2}
