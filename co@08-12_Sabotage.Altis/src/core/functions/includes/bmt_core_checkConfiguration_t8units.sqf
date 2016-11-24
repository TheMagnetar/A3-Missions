//=======================================================================================================//
// File: bmt_core_checkConfiguration_t8units.sqf                                                         //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/12/06                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to T8 Units.        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_var_requires_t8units != 2) then {
    if (bmt_var_requires_t8units != bmt_param_t8units_enabled) then {
        if (bmt_param_t8units_enabled == 1) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_t8units.sqf): T8 Units is active but it must be deactivated for this mission."];
        } else {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_t8units.sqf): T8 Units is disabled but must be enabled for this mission."];
        };
    };
};

if ((bmt_param_t8units_enabled == 0) and (bmt_param_t8units_debug == 1)) then {
    player sideChat format ["WARNING (bmt_core_checkConfiguration_t8units.sqf): The debug of T8 Units is enabled but the addon itself is disabled."];
};

if (bmt_param_t8units_dac == 1) then {
    if (!bmt_mod_dac) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_t8units.sqf): T8 Units is configured to use DAC but DAC is not loaded."];
    } else {
        if (bmt_param_dac_enabled == 0) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_t8units.sqf): T8 Units is configured to use DAC but DAC, despite being loaded, is not enabled."];
        };
    };
};

//============================================= END OF FILE =============================================//
