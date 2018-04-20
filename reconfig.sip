set_global_assignment -entity "reconfig" -library "lib_reconfig" -name IP_TOOL_NAME "alt_pr"
set_global_assignment -entity "reconfig" -library "lib_reconfig" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "reconfig" -library "lib_reconfig" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_reconfig" -name SPD_FILE [file join $::quartus(sip_path) "reconfig.spd"]

set_global_assignment -library "lib_reconfig" -name MISC_FILE [file join $::quartus(sip_path) "reconfig_sim/reconfig.v"]
set_global_assignment -library "lib_reconfig" -name MISC_FILE [file join $::quartus(sip_path) "reconfig_sim/alt_pr/alt_pr.v"]
