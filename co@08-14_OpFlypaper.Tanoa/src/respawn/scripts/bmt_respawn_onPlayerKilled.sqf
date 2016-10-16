//=======================================================================================================//
// File: bmt_respawn_onPlayerKilled.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document configures the onPlayerKilled event. For the moment ACE3 spectator mode    //
//              (http://ace3mod.com/wiki/feature/spectator.html) in case it is available, defaulting to  //
//              the vanila one if ACE3 is not loaded.                                                    //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Parameters passed when onPlayerKilled.
params [["_unit",objNull], ["_killer",objNull], ["_respawn",0], ["_respawnDelay",0]];
private ["_numRespawns"];

// End the mission if there are no alive units and respawn of type "NONE" or "BIRD".
if ((_respawn <= 1) and ({alive _x} count allPlayers <= 0)) exitWith {
    [] remoteExecCall ["bmt_fnc_endMission", 0, true];
};

// Substract tickets from player's pool or player's side pool.
_numRespawns = [] call bmt_fnc_respawn_substractTickets;

if ((_numRespawns == -1) or (_respawn <= 1)) then {
    player setVariable ["bmt_var_playerAlive", false, true];
    setPlayerRespawnTime 1e10;
    sleep 5;
    cutText ["You are dead! Entering spectator mode.", "PLAIN DOWN"];
    sleep 5;
};

if ((_respawn == 3) and ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {
    [] remoteExecCall ["bmt_fnc_endMission", 0, true];
};

if (bmt_param_respawn_saveGear == 1) then {
    _unit setVariable["bmt_array_savedLoadout",getUnitLoadout _unit];
};

//  Do not enter spectator mode if respawn time is less than 1 second.
if (playerRespawnTime <= 1) exitWith {};

// Do not enter spectator mode if there are still tickets available.
if ((_numRespawns >= 0) or (_numRespawns == -99)) exitWith {
    [true] call bmt_fnc_respawn_respawnCounter;
};

// If there was no killer then pass it as a random playable unit.
if (isNull _killer) then {
    _killer = selectRandom playableUnits;
};

// Enter spectator mode.
[_unit, _killer] call bmt_fnc_respawn_enterSpectator;

//============================================= END OF FILE =============================================//
