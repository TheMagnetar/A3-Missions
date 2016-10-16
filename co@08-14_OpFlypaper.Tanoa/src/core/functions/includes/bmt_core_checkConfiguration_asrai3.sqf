//=======================================================================================================//
// File: bmt_core_checkConfiguration_asrai3.sqf                                                          //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to ASR AI 3.        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_var_requires_asrai3 != 2) then {
    if (bmt_var_requires_asrai3 != bmt_param_asrai3_enabled) then {
        if (bmt_param_asrai3_enabled == 1) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_asrai3_asrai3.sqf): ASR AI 3 is necessary for this mission but it is not loaded."];
        } else {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_asrai3.sqf): ASR AI 3 is active but it must be deactivated for this mission."];
        };
    } else {
        if ((bmt_param_asrai3_enabled == 1) and !bmt_mod_asrai3) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_asrai3.sqf): ASR AI 3 is necessary for this mission but the file asr_ai3_main.pbo is not loaded."];
        };
    };
} else {
    if ((bmt_param_asrai3_enabled == 1) and !bmt_mod_asrai3) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_asrai3.sqf): ASR AI 3 is used in this mission but the file asr_ai3_main.pbo is not loaded."];
    };

    if ((bmt_param_asrai3_enabled == 0) and bmt_mod_asrai3) then {
        player sideChat format ["WARNING (bmt_core_checkConfiguration_asrai3.sqf): ASR AI 3 is not used in this mission but the file asr_ai3_main.pbo is loaded."];
    };
};

//============================================= END OF FILE =============================================//
