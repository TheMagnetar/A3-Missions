//=======================================================================================================//
// File: fn_endMission.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document defines under which circumstances any of the defined endings in the file   //
//              bmt_missionDebriefing.hpp is activated. It has to be ensured that this fucntion is       //
//              executed with global scope so that it affects both clients and servers.                  //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private["_destroyedAssets", "_numberAssets"];

_destroyedAssets = {!alive _x} count bmt_airAssets;
_numberAssets = count bmt_airAssets;

// Total success: All enemy air assets are destroyed.
if (_destroyedAssets == _numberAssets) then {
    ["EndingSuccess1", true] spawn BIS_fnc_endMission;
};

// Mission success: more than half of the enemy assets are destroyed.
if ((_destroyedAssets >= _numberAssets/2) and (_destroyedAssets < _numberAssets)) then {
    ["EndingSuccess2", true] spawn BIS_fnc_endMission;
};

// Mission failure: players dead but more than half of the enemy assets are destroyed.
if (({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0) and (_destroyedAssets >= _numberAssets/2)) then {
    ["EndingFailure1",false] spawn BIS_fnc_endMission;
};

if ((_destroyedAssets > 0) and (_destroyedAssets < _numberAssets/2)) then {
    ["EndingFailure2", false] spawn BIS_fnc_endMission;
};

// Mission failure: players dead with less than half air assets destroyed.
if (({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0) and (_destroyedAssets > 0) and (_destroyedAssets < _numberAssets/2)) then {
    ["EndingFailure3",false] spawn BIS_fnc_endMission;
};

// If all players are dead and none of the objectives were completed, the mission was a total disaster.
if (({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0) and (_destroyedAssets == 0)) then {
    ["Disaster",false] spawn BIS_fnc_endMission;
};

//============================================= END OF FILE =============================================//
