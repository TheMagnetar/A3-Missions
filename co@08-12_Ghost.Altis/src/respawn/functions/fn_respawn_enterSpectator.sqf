//=======================================================================================================//
// File: fn_respawn_enterSpectator.sqf                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This function enters spectator mode. The spectator mode that is used, ACE3 spectator or  //
//              BI's End Game Spectator, depends on mission parameters.                                  //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit entering the spectator mode <OBJECT>.                                         //
//               - 1: unit where the spectator camera will be initially focusing onto <OBJECT>.          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params [["_respawnUnit",objNull], ["_spectableUnit",objNull]];

// Hide seagull body.
if (_respawnUnit isKindOf "seagull") then {
    if (bmt_mod_ace3 && (bmt_param_ace3_spectator ==  1)) then {
        _spectableUnit = selectRandom playableUnits;
        [_respawnUnit] call ace_spectator_fnc_stageSpectator;
    };
};

// If ACE 3 is loaded use the spectator mode of ACE3. Use the vanila one otherwise (End Game Spectator).
if (bmt_mod_ace3 && (bmt_param_ace3_spectator ==  1)) then {
    if ( bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (bmt_respawn_onPlayerRespawn.sqf): Using ACE3 spectator mode."];
    };

    // Configure ACE3 spectator camera.
    [2, _spectableUnit] call ace_spectator_fnc_setCameraAttributes;
    [true] call ace_spectator_fnc_setSpectator;
} else {
    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (bmt_respawn_onPlayerRespawn.sqf): Using vanila spectator mode."];
    };

    // Put units into spectator mode depending on the radio system used.
    // Task Force Arrowhead Radio (TFAR)
    if (bmt_mod_tfar) then {
        [player, true] call TFAR_fnc_forceSpectator;
    };

    // Advanced Combat Radio Environment 2 (ACRE 2)
    if (bmt_mod_acre2) then {
        [true] call acre_api_fnc_setSpectator;
    };

    BIS_fnc_feedback_allowPP = false;  // Disable dying effects.
    // Start the End Game Spectator.
    // - All sides can be viewed.
    // - The AI cannot be observed.
    ["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;
};

//============================================= END OF FILE =============================================//
