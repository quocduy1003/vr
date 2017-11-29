derive_pg_connection 	\
	-power_net VDD	\
	-power_pin VDD	\
	-ground_net VSS	\
	-ground_pin VSS 

derive_pg_connection 	\
	-power_net VDD	\
	-power_pin VDD	\
	-ground_net VSS	\
	-ground_pin VSS -tie

derive_pg_connection 	 \
	-power_net VDD	 \
	-power_pin VDDIO \
	-ground_net VSS	 \
	-ground_pin VSSIO 

derive_pg_connection 	 \
	-power_net VDD	 \
	-power_pin VDDIO \
	-ground_net VSS	 \
	-ground_pin VSSIO -tie

