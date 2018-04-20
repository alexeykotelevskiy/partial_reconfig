set_global_assignment -entity "reconf" -library "lib_reconf" -name IP_TOOL_NAME "alt_pr"
set_global_assignment -entity "reconf" -library "lib_reconf" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "reconf" -library "lib_reconf" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_reconf" -name SPD_FILE [file join $::quartus(sip_path) "reconf.spd"]

set_global_assignment -library "lib_reconf" -name MISC_FILE [file join $::quartus(sip_path) "reconf_sim/reconf.v"]
set_global_assignment -library "lib_reconf" -name MISC_FILE [file join $::quartus(sip_path) "reconf_sim/alt_pr/alt_pr.v"]
