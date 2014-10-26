# Copyright (C) 1991-2011 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.


# Quartus II 32-bit Version 11.1 Build 216 11/23/2011 Service Pack 1 SJ Full Version
# File: signalprobe_qsf.tcl
# Generated on: Sat Jun 14 01:10:38 2014

# Note: This file contains a Tcl script generated from the SignalProbe Gui.
#       You can use this script to restore SignalProbes after deleting the DB
#       folder; at the command line use "quartus_cdb -t signalprobe_qsf.tcl".

package require ::quartus::chip_planner
package require ::quartus::project
project_open First_project -revision First_project
read_netlist
set had_failure 0

############
# Index: 1 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[15\]" -loc PIN_58 -pin_name "byte_data_received\[15\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[15\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[15\]\" -loc PIN_58 -pin_name \"byte_data_received\[15\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[15\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[15\]\" -loc PIN_58 -pin_name \"byte_data_received\[15\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 2 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[0\]" -loc PIN_1 -pin_name "byte_data_received\[0\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[0\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[0\]\" -loc PIN_1 -pin_name \"byte_data_received\[0\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[0\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[0\]\" -loc PIN_1 -pin_name \"byte_data_received\[0\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 3 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[13\]" -loc PIN_56 -pin_name "byte_data_received\[13\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[13\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[13\]\" -loc PIN_56 -pin_name \"byte_data_received\[13\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[13\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[13\]\" -loc PIN_56 -pin_name \"byte_data_received\[13\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 4 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[11\]" -loc PIN_54 -pin_name "byte_data_received\[11\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[11\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[11\]\" -loc PIN_54 -pin_name \"byte_data_received\[11\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[11\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[11\]\" -loc PIN_54 -pin_name \"byte_data_received\[11\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 5 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[9\]" -loc PIN_52 -pin_name "byte_data_received\[9\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[9\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[9\]\" -loc PIN_52 -pin_name \"byte_data_received\[9\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[9\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[9\]\" -loc PIN_52 -pin_name \"byte_data_received\[9\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 6 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[7\]" -loc PIN_50 -pin_name "byte_data_received\[7\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[7\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[7\]\" -loc PIN_50 -pin_name \"byte_data_received\[7\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[7\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[7\]\" -loc PIN_50 -pin_name \"byte_data_received\[7\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 7 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[6\]" -loc PIN_5 -pin_name "byte_data_received\[6\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[6\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[6\]\" -loc PIN_5 -pin_name \"byte_data_received\[6\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[6\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[6\]\" -loc PIN_5 -pin_name \"byte_data_received\[6\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 8 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[5\]" -loc PIN_42 -pin_name "byte_data_received\[5\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[5\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[5\]\" -loc PIN_42 -pin_name \"byte_data_received\[5\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[5\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[5\]\" -loc PIN_42 -pin_name \"byte_data_received\[5\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

############
# Index: 9 #
############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[8\]" -loc PIN_51 -pin_name "byte_data_received\[8\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[8\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[8\]\" -loc PIN_51 -pin_name \"byte_data_received\[8\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[8\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[8\]\" -loc PIN_51 -pin_name \"byte_data_received\[8\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 10 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[10\]" -loc PIN_53 -pin_name "byte_data_received\[10\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[10\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[10\]\" -loc PIN_53 -pin_name \"byte_data_received\[10\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[10\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[10\]\" -loc PIN_53 -pin_name \"byte_data_received\[10\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 11 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[12\]" -loc PIN_55 -pin_name "byte_data_received\[12\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[12\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[12\]\" -loc PIN_55 -pin_name \"byte_data_received\[12\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[12\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[12\]\" -loc PIN_55 -pin_name \"byte_data_received\[12\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 12 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[14\]" -loc PIN_57 -pin_name "byte_data_received\[14\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[14\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[14\]\" -loc PIN_57 -pin_name \"byte_data_received\[14\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[14\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[14\]\" -loc PIN_57 -pin_name \"byte_data_received\[14\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 13 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[4\]" -loc PIN_41 -pin_name "byte_data_received\[4\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[4\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[4\]\" -loc PIN_41 -pin_name \"byte_data_received\[4\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[4\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[4\]\" -loc PIN_41 -pin_name \"byte_data_received\[4\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 14 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[3\]" -loc PIN_40 -pin_name "byte_data_received\[3\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[3\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[3\]\" -loc PIN_40 -pin_name \"byte_data_received\[3\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[3\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[3\]\" -loc PIN_40 -pin_name \"byte_data_received\[3\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 15 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[2\]" -loc PIN_38 -pin_name "byte_data_received\[2\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[2\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[2\]\" -loc PIN_38 -pin_name \"byte_data_received\[2\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[2\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[2\]\" -loc PIN_38 -pin_name \"byte_data_received\[2\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

#############
# Index: 16 #
#############
set result [ make_sp  -clk  "SCK" -regs 1 -src_name "byte_data_received\[1\]" -loc PIN_100 -pin_name "byte_data_received\[1\]_signalProbe" -io_std "3.3-V LVTTL" ] 
if { $result == 0 } { 
	 puts "FAIL (byte_data_received\[1\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[1\]\" -loc PIN_100 -pin_name \"byte_data_received\[1\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} else { 
 	 puts "SET  (byte_data_received\[1\]_signalProbe): make_sp  -clk  \"SCK\" -regs 1 -src_name \"byte_data_received\[1\]\" -loc PIN_100 -pin_name \"byte_data_received\[1\]_signalProbe\" -io_std \"3.3-V LVTTL\""
} 

