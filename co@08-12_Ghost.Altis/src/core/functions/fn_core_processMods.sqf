//=======================================================================================================//
// File: fn_core_processMods.sqf                                                                         //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/09                                                                             //
// Description: This function has the goal of identifying if certain mods have been loaded for further   //
//              and more in depth configuration in other scripts in this template.                       //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

bmt_mod_acre2 = isClass (configFile >> "CfgPatches" >> "acre_main");         // Check if ACRE 2 is loaded.
bmt_mod_tfar = isClass (configFile >> "CfgPatches" >> "task_force_radio");   // Check if TFAR is loaded.

bmt_mod_ace3 = isClass (configFile >> "CfgPatches" >> "ace_common");         // Check if ACE 3 is loaded.
bmt_mod_ace3medical = isClass (configFile >> "CfgPatches" >> "ace_medical"); // Check if ACE 3 (medical system) is loaded.
bmt_mod_ace3advbal = isClass (configFile >> "CfgPatches" >> "ace_advanced_ballistics"); // Check if ACE 3 (advanced ballistics) is loaded.

bmt_mod_agm = isClass (configFile >> "CfgPatches" >> "agm_core");            // Check if AGM is loaded.

bmt_mod_dac = isClass (configFile >> "CfgPatches" >> "dac_source");          // Check if el DAC is loaded (addon version).
bmt_mod_asrai3 = isClass (configFile >> "CfgPatches" >> "asr_ai3_main");     // Check if ASR AI 3 is loaded.

// Make the variables public.
if (isServer) then {
    publicVariable "bmt_mod_acre2";
    publicVariable "bmt_mod_tfar";
    publicVariable "bmt_mod_ace3";
    publicVariable "bmt_mod_ace3medical";
    publicVariable "bmt_mod_ace3advbal";
    publicVariable "bmt_mod_agm";
    publicVariable "bmt_mod_dac";
    publicVariable "bmt_mod_asrai";
};

//============================================= END OF FILE =============================================//
