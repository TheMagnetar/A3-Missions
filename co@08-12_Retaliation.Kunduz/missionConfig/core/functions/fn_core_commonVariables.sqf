//=======================================================================================================//
// File: fn_core_commonVariables.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/01                                                                             //
// Description: This document declares common variables used in the Arma 3 Basic Mission Template        //
//              (A3-BMT) scripts and functions         .                                                 //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Private variables.
private ["_length_groups", "_length_frequencies", "_length_frequenciesLR"];

//=======================================================================================================//
// Configuration of mods and scripts required by the mission. Each and every of the following variables  //
// can have the following values:                                                                        //
//   - 0: mod or script must be disabled.                                                                //
//   - 1: mod or script must be enabled.                                                                 //
//   - 2: It does not matter if the mod or script is enabled or disabled for the mission.                //
//=======================================================================================================//

bmt_var_requires_ace3        = 2;  // Variable to control the use of Advanced Combat Environment 3.
bmt_var_requires_ace3_BasMed = 2;  // Variable to control the use of basic medical system of ACE 3.
bmt_var_requires_ace3_AdvMed = 2;  // Variable to control the use of advanced medical system of ACE 3.
bmt_var_requires_ace3_AdvBal = 2;  // Variable to control the use of advanced ballistics of ACE 3.
bmt_var_requires_acre2       = 2;  // Variable to control the use of Advanced Combat Radio Environment 2.
bmt_var_requires_asrai3      = 2;  // Variable to control the use of ASR AI 3.
bmt_var_requires_dac         = 2;  // Variable to control the use of Dynamic-AI-Creator (DAC).
bmt_var_requires_VAProfiles  = 2;  // Variable to control the use of Virtual Arsenal Profiles.
bmt_var_requires_t8units     = 2;  // Variable to control the use of T8 Units.
bmt_var_requires_tfar        = 2;  // Variable to control the use of Task Force Arrowhead Radio.

// List of units with a "Rifleman Radio" (fn_configEquipment.sqf).
bmt_array_riflemanRadio = ["me", "rfl", "rflat", "rfluav", "gr", "ar", "aar", "dm", "mg", "amg", "at", "aat", "aa", "aaa", "en", "exp", "divme", "divexp", "div", "hplt", "jplt", "ccrw"];

// List of units with a "Short Range Radio ""(fn_configEquipment.sqf).
bmt_array_shortRangeRadio = ["pl", "psg", "rto", "fo", "jtac", "sl", "tl", "sn", "sp", "divsl"];

// List of units with a "Long Range Radio" (fn_configEquipment.sqf).
bmt_array_longRangeRadio = ["rto", "fo", "jtac"];

//=======================================================================================================//
// Radio and callsign configuration: These variables are used in order to automatically configure radio  //
// channels, frequencies and group callsigns. Both Task Force Arrowhead Radio (TFAR) and Advanced Combat //
// Radio Environment 2 (ACRE2) are supported.                                                            //
//                                                                                                       //
// - bmt_array_groups: defines the group structure. If more groups are added, the varialbes controlling  //
//                     radio frequencies, "bmt_array_frequenciesShortRange" and                          //
//                     "bmt_array_frequenciesLongRange", must be modified so that they have the same     //
//                     number of elements. When defining groups it is important to keep the following    //
//                     structure:                                                                        //
//                                                                                                       //
//                                  [ GroupX, SubgroupX1, SubgroupX2, ... , SubgroupXn]                  //
//                                                                                                       //
//                     Additional radio configuration parameters can be found in:                        //
//                      - "missionConfig/acre2/scripts/bmt_acre2_configuration.sqf                       //
//                      - "missionConfig/acre2/scripts/bmt_tfar_configuration.sqf                        //
//                                                                                                       //
// - bmt_array_frequenciesShortRange: is used together with "bmt_array_groups" in order to configure     //
//                                    radio frequencies for TFAR and ACRE2. Both array sizes must have   //
//                                    the same amount of elements.                                       //
//=======================================================================================================//

bmt_array_groups = [
    ["Alpha 1", "Alpha 1-1", "Alpha 1-2", "Alpha 1-3"],
    ["Alpha 2", "Alpha 2-1", "Alpha 2-2", "Alpha 2-3"],
    ["Alpha 3", "Alpha 3-1", "Alpha 3-2", "Alpha 3-3"],
    ["Command"],
    ["Support"],
    ["Artillery"]
];

bmt_array_frequenciesShortRange = [
    [200, 201, 202, 203],
    [210, 211, 212, 213],
    [220, 221, 222, 223],
    [41],
    [51],
    [61]
];

bmt_array_frequenciesLongRange = [
    [41],
    [42],
    [43],
    [40],
    [30],
    [50]
];

// Check that both arrays have the same length.
_length_groups = count bmt_array_groups;
_length_frequencies = count bmt_array_frequenciesShortRange;
_length_frequenciesLR = count bmt_array_frequenciesLongRange;

if (_length_groups != _length_frequencies) then {
    player sideChat format ["ERROR (fn_core_commonVariables.sqf): Variables ""_length_groups"" and ""_length_frequencies"" do not have the same length."];
} else {
    {
        if ( count _x != count (bmt_array_frequenciesShortRange select _forEachIndex) ) then {
            player sideChat format ["ERROR (fn_core_commonVariables.sqf): subgroup %1 of the variables ""_length_groups"" and ""_length_frequencies"" do not have the same length.", _forEachIndex];
        };
    } forEach bmt_array_groups;
};

if (_length_groups != _length_frequenciesLR) then {
    player sideChat format ["ERROR (fn_core_commonVariables.sqf): Variables ""_length_groups"" and ""_length_frequenciesLR"" do not have the same length."];
};

//=======================================================================================================//
// Teleport points configuration: The following variables define the teleport points that are available  //
// during the mission. They are configured, by the function "bmt_fnc_misc_teleport_configurePoints",     //
// during the postInit phase.                                                                            //
//                                                                                                       //
// - bmt_var_teleportPoints_Start: are the different objects that allow a unit to teleport through an    //
//                                 action. These objets will receive the teleport action.                //
// - bmt_var_teleportPoints_Destination: are the different markers where a unit will be teleported. For  //
//                                       each entry in "bmt_var_teleportPoints_Start", an array must be  //
//                                       filled with all possible destinations.                          //
//                                                                                                       //
// Exemple: A mission with three possible teleport points. From the base both, the HQ1 and HQ2 can be    //
//          accessed, but from HQ1 and HQ2 only the base can be accessed.                                //
//                                                                                                       //
//          bmt_var_teleportPoints_Start       = [teleportBase, teleportHQ1, teleportHQ2];               //
//          bmt_var_teleportPoints_Destination = [["marker_teleportHQ1", "marker_teleportHQ2"],          //
//                                                ["marker_teleportBase"],                               //
//                                                ["marker_teleportBase"]                                //
//                                               ];                                                      //
//=======================================================================================================//

bmt_var_teleportPoints_Destination = [];
bmt_var_teleportPoints_Start = [];

if (count bmt_var_teleportPoints_Destination != count bmt_var_teleportPoints_Start) exitWith {
    player sideChat format ["ERROR (fn_core_commonVariables.sqf): Variables ""bmt_var_teleportPoints_Destination"" and ""bmt_var_teleportPoints_Start"" do not have the same length."];
};
//============================================= END OF FILE =============================================//
