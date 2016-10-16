//=======================================================================================================//
// File: fn_t8units_config.sqf                                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/08/25                                                                             //
// Description: This function configures the T8 units variables as per version 0.70 depending on mission //
//              parameters. It is called in externalScripts/T8/fnc/fn_INIT.sqf.                          //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_param_t8units_debug == 0) then {
    T8U_var_DEBUG        = false;  // general Debug
    T8U_var_DEBUG_hints  = false;  // show Debug Hints
    T8U_var_DEBUG_marker = false;  // create Debug Markers
} else {
    T8U_var_DEBUG        = true;   // general Debug
    T8U_var_DEBUG_hints  = true;   // show Debug Hints
    T8U_var_DEBUG_marker = true;   // create Debug Markers
};

// Options to work with DAC
if (bmt_param_t8units_dac == 0) then {
    T8U_var_AllowDAC     = false;  // Disable DAC
} else {
    T8U_var_AllowDAC     = true;   // Allow DAC
};

//============================================= END OF FILE =============================================//
