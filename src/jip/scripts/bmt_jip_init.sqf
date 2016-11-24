//=======================================================================================================//
// File: bmt_jip_init.sqf                                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This script checks whether JIP players are supported or not. If JIP is not allowed after //
//              a certain amount of time, the player is killed.                                          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_initialPlayer"];

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
                waitUntil {sleep 1; time > bmt_var_jipAllowedTime};
                missionNamespace setVariable ["bmt_var_jip_allowed", false, true];
            };
        };

        // Handle JIP persistence (disconnect/reconnect).
        if (bmt_param_jip_saveStatus == 1) then {
            bmt_missionEH_jip = addMissionEventHandler ["HandleDisconnect", {[_this select 0, _this select 2, _this select 3] call bmt_fnc_jip_saveStatus;}];
        };

    } else {
        // If JIP is disabled deny entry to JIP players.
        missionNamespace setVariable ["bmt_var_jip_allowed", false, true];
    };
};

if (hasInterface) then {

    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (bmt_jip_init.sqf): player is JIP: %1. JIP is enabled: %2.", didJip, missionNamespace getVariable ["bmt_var_jip_allowed", true]];
    };

    if (didJiP) then {

        // Check if the player is in the initial player list
        _initialPlayer = [player] call bmt_fnc_jip_check_allowedJIPPlayerList;

        // Kill the player if JIP is not allowed and exit.
        if (!(missionNamespace getVariable ["bmt_var_jip_allowed", true]) AND !_initialPlayer) then {
            // Wait a little before killing the player.
            sleep 1;

            // Remove any possibility of respawning.
            player setVariable ["bmt_var_numRespawns", -1, true];
            player setDamage 1;

            sleep 5;
            "normal" cutText ["This mission does not support JIP. Be punctual next time!", "PLAIN"];
        } else {

            // Since JIP is still allowed, add the new player to the list of allowed players.
            if (!_initialPlayer) then {
                [player] call bmt_fnc_jip_addTo_allowedJIPPlayerList;
            } else {
                // Player is already defined. Therefore, he is reconnecting.
                if (bmt_param_jip_saveStatus == 1) then {
                    [player] call bmt_fnc_jip_retrieveStatus;
                };
            };

            bmt_script_jipTeleport = [] spawn {
                waituntil{!(isNull (findDisplay 46)) && player getVariable ["bmt_var_init_introFinished", false] };
                // Teleport to squad. Thanks to Columndrum for the elegant KeyDown concept. Enhanced by TheMagnetar.
                player setVariable ["bmt_var_jipTeleport_enabled", true];
                hint "Press F11 to teleport to your squad or any other friendly unit. You have 5 minutes.";

                bmt_displayEventHandler_jipTeleport = (findDisplay 46) displayAddEventHandler ["KeyDown","[_this, player] call bmt_fnc_jip_teleport"];

                sleep 300;
                hint "5 minutes have passed. You cannot teleport to your squad anymore.";

                // Forbid possibility to teleport by deleting the displayRemoveEventHandler
                if (!isNil "bmt_displayEventHandler_jipTeleport" ) then {
                    (findDisplay 46) displayRemoveEventHandler ["KeyDown", bmt_displayEventHandler_jipTeleport];
                };
            };
        };
    } else {
        // Initialise a list of all players that initially connect.
        [player] remoteExecCall ["bmt_fnc_jip_init_allowedJIPPlayerList", 2, false];
    };

    // Handle JIP persistence (disconnect/reconnect).
    if ((bmt_param_jip_saveStatus == 1) && (isClass (configFile >> "CfgPatches" >> "ace_advanced_fatigue"))) then {
        bmt_script_saveAdvancedFatigue = [] spawn {
            while {true} do {
                sleep 1;
                [player] call bmt_fnc_jip_saveStatus_AdvancedFatigue;
            };
        };
    };

    player setVariable ["bmt_var_init_configJIPReady", true, true];
};

//============================================= END OF FILE =============================================//
