set_global_assignment -entity "cordic2" -library "lib_cordic2" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "cordic2" -library "lib_cordic2" -name IP_TOOL_VERSION "15.0"
set_global_assignment -entity "cordic2" -library "lib_cordic2" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_cordic2" -name SPD_FILE [file join $::quartus(sip_path) "../cordic2.spd"]
set_global_assignment -library "lib_cordic2" -name MISC_FILE [file join $::quartus(sip_path) "../../cordic2.qsys"]

set_global_assignment -library "lib_cordic2" -name MISC_FILE [file join $::quartus(sip_path) "cordic2.v"]
set_global_assignment -library "lib_cordic2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/cordic2_CORDIC_0.vo"]
