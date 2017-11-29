puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Variables common to all reference methodology scripts
# Script: common_setup.tcl
# Version: G-2012.06-SP4 (January 11, 2013)
# Copyright (C) 2007-2013 Synopsys, Inc. All rights reserved.
##########################################################################################

set DESIGN_NAME                   "vr"  ;#  The name of the top-level design

set DESIGN_REF_DATA_PATH          "/home/lampham/WORK/01_LamPham/07_For_Chuong_Tri/01_design"
                                       #  Use this variable to prefix the common absolute path  
                                       #  to the common variables defined below.
                                       #  Absolute paths are mandatory for hierarchical 
                                       #  reference methodology flow.

##########################################################################################
# Hierarchical Flow Design Variables
##########################################################################################

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH        "/home/lampham/WORK/01_LamPham/07_For_Chuong_Tri/02_synthesis/rm_setup /home/lampham/WORK/01_LamPham/07_For_Chuong_Tri/01_design /home/lampham/WORK/01_LamPham/07_For_Chuong_Tri/01_design /home/lampham/TOOL/Library/Thai_90nm_Synopsys/SAED90_EDK/SAED_EDK90nm/Memories/synopsys/models /home/lampham/TOOL/Library/Thai_90nm_Synopsys/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models /home/lampham/TOOL/Library/Thai_90nm_Synopsys/SAED90_EDK/SAED_EDK90nm_IO/IO_Standard_Cell_Library/synopsys/models"  ;

#set TARGET_LIBRARY_FILES          "scx2_tsmc_cl013g_ss_1p08v_125c.db tpd013nv3wc.db mfcc_memory_slow_syn.db int_model_memory_slow_syn.db"  ;#  Target technology logical libraries

#set TARGET_LIBRARY_FILES          "saed90nm_typ_ht_pg.db saed90nm_io_min.db SRAM4X128.db"  ;#  Target technology logical libraries
set TARGET_LIBRARY_FILES          "saed90nm_min.db saed90nm_io_min.db SRAM32x512_1rw_min.db"  ;#  Target technology logical libraries
set ADDITIONAL_LINK_LIB_FILES     ""  ;#  Extra link logical libraries not included in TARGET_LIBRARY_FILES

set MIN_LIBRARY_FILES             ""  ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

set MW_REFERENCE_LIB_DIRS         ""  ;#  Milkyway reference libraries (include IC Compiler ILMs here)

set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the Milkyway reference libs

set TECH_FILE                     ""  ;#  Milkyway technology file
set MAP_FILE                      ""  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              ""  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              ""  ;#  Min TLUplus file


set MW_POWER_NET                "VDD" ;#
set MW_POWER_PORT               "VDD" ;#
set MW_GROUND_NET               "VSS" ;#
set MW_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            ""   ;# Min routing layer
set MAX_ROUTING_LAYER            ""   ;# Max routing layer

set LIBRARY_DONT_USE_FILE        ""   ;# Tcl file with library modifications for dont_use

##########################################################################################
# Multivoltage Common Variables
#
# Define the following multivoltage common variables for the reference methodology scripts 
# for multivoltage flows. 
# Use as few or as many of the following definitions as needed by your design.
##########################################################################################

set PD1                          ""           ;# Name of power domain/voltage area  1
set VA1_COORDINATES              {}           ;# Coordinates for voltage area 1
set MW_POWER_NET1                "VDD1"       ;# Power net for voltage area 1

set PD2                          ""           ;# Name of power domain/voltage area  2
set VA2_COORDINATES              {}           ;# Coordinates for voltage area 2
set MW_POWER_NET2                "VDD2"       ;# Power net for voltage area 2

set PD3                          ""           ;# Name of power domain/voltage area  3
set VA3_COORDINATES              {}           ;# Coordinates for voltage area 3
set MW_POWER_NET3                "VDD3"       ;# Power net for voltage area 3

set PD4                          ""           ;# Name of power domain/voltage area  4
set VA4_COORDINATES              {}           ;# Coordinates for voltage area 4
set MW_POWER_NET4                "VDD4"       ;# Power net for voltage area 4

puts "RM-Info: Completed script [info script]\n"

