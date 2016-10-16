//=======================================================================================================//
// File: bmt_jip_init.sqf                                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This script checks whether JIP players are supported or not. If JIP is not allowed after //
//              a certain amount of time, the player is killed.                                          //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// If time limit is a positive value check until when JIP players are allowed. With a negative value, JIP
// players are allowed to enter the game at any time.

if (bmt_param_jip_enabled == 1) then {
    bmt_var_jipAllowedTime = getNumber (missionConfigFile >> "bmt_config" >> "bmt_config_jipAllowedTime");

    if (bmt_var_jipAllowedTime == 0.0) then {
        player sideChat format ["ERROR (bmt_jip_init.sqf): JIP is enabled but JIP allowed time is set to 0 in bmt_missionConfig.hpp!"];
    };
} else {
    bmt_var_jipAllowedTime = 0.0;
};

if (isServer) then {
    if (bmt_param_jip_enabled == 1) then {
        if (bmt_var_jipAllowedTime > 0) then {
            bmt_script_jipServerTime = [] spawn {
                waitUntil {time > bmt_var_jipAllowedTime};
                missionNamespace setVariable ["bmt_var_jip_allowed", false, true];
            };
        };
    } else {
        // If JIP is disabled deny entry to JIP players.
        missionNamespace setVariable ["bmt_var_jip_allowed", false, true];
    };
};

if (hasInterface and (bmt_param_debugOutput == 1)) then {
    player sideChat format ["DEBUG (bmt_jip_init.sqf): player is JIP: %1. JIP is enabled: %2.", didJip, missionnamespace getVariable ["bmt_var_jip_allowed", true]];
};

// Kill the player if JIP is not allowed.
if (hasInterface && didJiP && !(missionnamespace getVariable ["bmt_var_jip_allowed", true])) exitWith {

    // Wait a little before killing the player.
    sleep 1;

    // Remove any possibility of respawning.
    player setVariable ["bmt_var_numRespawns", -1, true];
    player setDamage 1;

    sleep 5;
    "normal" cutText ["This mission does not support JIP. Be punctual next time!", "PLAIN"];
};

//============================================= END OF FILE =============================================//
