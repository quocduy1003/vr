
create_cell { vdd_l vdd_r vdd_t vdd_b } {saed90nm_io_min/VDD}
set_pad_physical_constraints -pad_name "vdd_b" -side 4 -order 1
set_pad_physical_constraints -pad_name "vdd_r" -side 3 -order 1
set_pad_physical_constraints -pad_name "vdd_t" -side 2 -order 1
set_pad_physical_constraints -pad_name "vdd_l" -side 1 -order 1
create_cell { vss_l vss_r vss_t vss_b } {saed90nm_io_min/VSS}
set_pad_physical_constraints -pad_name "vss_b" -side 4 -order 2
set_pad_physical_constraints -pad_name "vss_r" -side 3 -order 2
set_pad_physical_constraints -pad_name "vss_t" -side 2 -order 2
set_pad_physical_constraints -pad_name "vss_l" -side 1 -order 2

create_cell { vss_io } {saed90nm_io_min/IOVSS}
set_pad_physical_constraints -pad_name "vss_io" -side 4 -order 3
create_cell { vdd_io } {saed90nm_io_min/IOVDD}
set_pad_physical_constraints -pad_name "vdd_io" -side 2 -order 3
