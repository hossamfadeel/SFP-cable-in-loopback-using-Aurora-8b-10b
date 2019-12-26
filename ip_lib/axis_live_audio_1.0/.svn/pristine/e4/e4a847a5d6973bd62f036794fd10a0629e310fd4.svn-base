# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "C_USE_AUDIO_IN"
  ipgui::add_param $IPINST -name "C_USE_AUDIO_OUT"

}

proc update_PARAM_VALUE.C_USE_AUDIO_IN { PARAM_VALUE.C_USE_AUDIO_IN } {
	# Procedure called to update C_USE_AUDIO_IN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_AUDIO_IN { PARAM_VALUE.C_USE_AUDIO_IN } {
	# Procedure called to validate C_USE_AUDIO_IN
	return true
}

proc update_PARAM_VALUE.C_USE_AUDIO_OUT { PARAM_VALUE.C_USE_AUDIO_OUT } {
	# Procedure called to update C_USE_AUDIO_OUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_AUDIO_OUT { PARAM_VALUE.C_USE_AUDIO_OUT } {
	# Procedure called to validate C_USE_AUDIO_OUT
	return true
}


proc update_MODELPARAM_VALUE.C_USE_AUDIO_IN { MODELPARAM_VALUE.C_USE_AUDIO_IN PARAM_VALUE.C_USE_AUDIO_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_AUDIO_IN}] ${MODELPARAM_VALUE.C_USE_AUDIO_IN}
}

proc update_MODELPARAM_VALUE.C_USE_AUDIO_OUT { MODELPARAM_VALUE.C_USE_AUDIO_OUT PARAM_VALUE.C_USE_AUDIO_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_AUDIO_OUT}] ${MODELPARAM_VALUE.C_USE_AUDIO_OUT}
}

