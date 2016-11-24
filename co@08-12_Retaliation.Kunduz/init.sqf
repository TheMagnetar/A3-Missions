//=======================================================================================================//
// File: init.sqf                                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This file is executed in a multiplayer environment at the end of the initialization      //
//              order of execution. It is used to further configure addons, briefings, radios, etc.      //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// BMT components are not loaded
if (hasInterface) then {
    missionNamespace setVariable ["bmt_var_init_preloadCompleted", false, false];
};

//=======================================================================================================//
// Disable Saving and Automatic Saving. https://community.bistudio.com/wiki/enableSaving                 //
//=======================================================================================================//
enableSaving [false, false];

//=======================================================================================================//
// Disable radio chatter: https://community.bistudio.com/wiki/enableSentences                            //
//=======================================================================================================//
enableSentences false;

//=======================================================================================================//
// Execute briefing scripts.                                                                             //
//=======================================================================================================//
bmt_script_briefing = [] execVM "src\briefing\scripts\bmt_briefing.sqf";

//=======================================================================================================//
// Initialise the T8 Units script if the A3BMT T8Units component is loaded.                              //
//=======================================================================================================//
if (bmt_param_t8units_enabled == 1) then {
    bmt_script_t8units = [] execVM "src\t8units\scripts\bmt_t8units_init.sqf";
};

//=======================================================================================================//
// Use virtual arsenal profiles instead of custom loadout equipment. When enabled the loadout defined in //
// configEquipment scripts is overwritten by the equivalent Virtual Arsenal profile.                     //
//=======================================================================================================//
if ((bmt_param_useVAProfiles == 1) && hasInterface) then {
    bmt_script_useVAProfiles = [] execVM "src\configEquipment\scripts\bmt_configEquipment_VAprofiles.sqf";
};

// Wait until player is initalised in order to execute the rest of the script.
if (!isDedicated && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player && player == player && time > 1};
};

//=======================================================================================================//
// JIP supprt.                                                                                           //
//=======================================================================================================//
if (bmt_param_jip_enabled == 1) then {
    bmt_script_jip = [] execVM "src\jip\scripts\bmt_jip_init.sqf";
    if (hasInterface) then {
        waitUntil { scriptDone bmt_script_jip };
    };

};

//=======================================================================================================//
// Initialialise radio mods. These mods are supported:                                                   //
//    - Advanced Combat Radio Environment 2 (ACRE 2).                                                    //
//    - Task Force Arrowhead Radio (TFAR).                                                               //
//=======================================================================================================//

// Configure TFAR if it is loaded (see file fn_core_processMods.sqf).
if (bmt_mod_tfar) then {
    bmt_script_radio = [] execVM "src\tfar\scripts\bmt_tfar_init.sqf";
};

// Configure ACRE 2 if it is loaded (see file fn_core_processMods.sqf).
if (bmt_mod_acre2) then {
    bmt_script_radio = [] execVM "src\acre2\scripts\bmt_acre2_init.sqf";
};

if (hasInterface) then {
    bmt_script_preloadCompleted = [] spawn {
        waitUntil { player getVariable ["bmt_var_init_configRadiosReady", false] };
        missionNamespace setVariable ["bmt_var_init_preloadCompleted", true, false];
    };
};

//=======================================================================================================//
// Mission introduction screen.                                                                          //
//=======================================================================================================//
bmt_script_intro = [] execVM "missionConfig\intro\scripts\bmt_intro.sqf";

//=======================================================================================================//
// Add all editor placed objects and units to Zeus. The eventhandlers will run every time a new unit is  //
// placed in order to synchronise it with all present curators.                                          //
//=======================================================================================================//
if (isServer) then {
    bmt_script_zeus = [] execVM "src\zeus\scripts\bmt_zeus_init.sqf"
};

//=======================================================================================================//
// This file executes scripts that are especific to a mission.                                           //
//=======================================================================================================//
#include "missionConfig\bmt_init.sqf"

//============================================= END OF FILE =============================================//
