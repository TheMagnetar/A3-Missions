//=======================================================================================================//
// File: bmt_core_checkConfiguration_dac.sqf                                                             //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to                  //
//              Dynamic-AI-Creator 3.1b (DAC).                                                           //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_var_requires_dac != 2) then {
    if (bmt_var_requires_dac != bmt_param_dac_enabled) then {
        if (bmt_param_dac_enabled == 1) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_dac.sqf): DAC is necessary for this mission but it is not loaded."];
        } else {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_dac.sqf): DAC is active but it must be deactivated for this mission."];
        };
    } else {
        if ((bmt_param_dac_enabled == 1) and !bmt_mod_dac) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_dac.sqf): DAC is necessary for this mission but the file dac_source.pbo is not loaded."];
        };
    };
} else {
    if ((bmt_param_dac_enabled == 1) and !bmt_mod_dac) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_dac.sqf): DAC is used in this mission but the file dac_source.pbo is not loaded."];
    };

    if ((bmt_param_asrai3_enabled == 0) and bmt_mod_dac) then {
        player sideChat format ["WARNING (bmt_core_checkConfiguration_dac.sqf): DAC is not used in this mission but the file dac_source.pbo is loaded."];
    };
};

if ((bmt_param_dac_enabled == 0) and (bmt_param_dac_debug == 1)) then {
    player sideChat format ["WARNING (bmt_core_checkConfiguration_dac.sqf): The debug of DAC is enabled but the addon itself is disabled."];
};

//============================================= END OF FILE =============================================//
