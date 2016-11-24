//=======================================================================================================//
// File: bmt_respawn_onPlayerKilled.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document configures the onPlayerKilled event. For the moment ACE3 spectator mode    //
//              (http://ace3mod.com/wiki/feature/spectator.html) in case it is available, defaulting to  //
//              the vanila one if ACE3 is not loaded.                                                    //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit that has been killed <OBJECT>.                                                //
//               - 1: unit that made he kill <OBJECT>.                                                   //
//               - 2: respawn type <SCALAR>.                                                             //
//               - 3: number of seconds until respawn <SCALAR>.                                          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Parameters passed when onPlayerKilled.
params [["_unit",objNull], ["_killer",objNull], ["_respawn",0], ["_respawnDelay",0]];
private ["_numRespawns"];

// Substract tickets from player's pool or player's side pool.
_numRespawns = [player, "substract"] call bmt_fnc_respawn_manageTickets;

if ((_numRespawns == -1) or (_respawn == 0)) then {
    player setVariable ["bmt_var_playerAlive", false, true];
    setPlayerRespawnTime 1e10;
};

if (((_respawn == 3) || (_respawn == 0)) and ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {

    sleep 1;
    // Execute the respawn effects.
    if ((bmt_param_respawn_killCam == 1) && (!isNull _killer)) then {
        bmt_script_respawnCamera = [_killer] execVM "src\respawn\scripts\bmt_respawn_effects.sqf";
    } else {
        bmt_script_respawnCamera = [_unit] execVM "src\respawn\scripts\bmt_respawn_effects.sqf";
    };

    sleep 6;
    [] remoteExecCall ["bmt_fnc_endMission", 0, true];
};

if (bmt_param_respawn_saveGear == 1) then {
    _unit setVariable["bmt_array_savedLoadout",getUnitLoadout _unit];
    if (bmt_mod_ace3) then {
        _unit setVariable ["bmt_var_hasEarPlugs", _unit getVariable ["ACE_hasEarPlugsin", false]];
    };
};

//  Do not enter spectator mode if respawn time is less than 1 second.
if (playerRespawnTime <= 1) exitWith {};

sleep 1;

// Execute the respawn effects.
if ((bmt_param_respawn_killCam == 1) && (!isNull _killer)) then {
    bmt_script_respawnCamera = [_killer] execVM "src\respawn\scripts\bmt_respawn_effects.sqf";
} else {
    bmt_script_respawnCamera = [_unit] execVM "src\respawn\scripts\bmt_respawn_effects.sqf";
};

sleep 1;

// Do not enter spectator mode if there are still tickets available.
if ((_numRespawns >= 0) or (_numRespawns == -99)) then {
    [true] call bmt_fnc_respawn_respawnCounter;
} else {

    sleep 3;
    cutText ["You are dead! Entering spectator mode.", "PLAIN DOWN"];
    sleep 5;

    // If there was no killer or the kill cam is disabled then pass it as a random playable unit.
    if (isNull _killer || (bmt_param_respawn_killCam == 0)) then {
        if ({alive _x} count allUnits > 0 ) then {
            _killer = selectRandom playableUnits;
        } else {
            _killer = _unit;
        };
    };

    // Enter spectator mode.
    bmt_respawn_camera = false;

    sleep 0.2;

    [_unit, _killer] call bmt_fnc_respawn_enterSpectator;
};


//============================================= END OF FILE =============================================//
