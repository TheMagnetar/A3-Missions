//=======================================================================================================//
// File: fn_jip_addTo_allowedJIPPlayerList.sqf                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function adds a JIP player that is allowed to join the mission for the rest of it,  //
//              even if it disconnects and JIP is disabled. The UID of the player as well as the profile //
//              name are added as another entry.                                                         //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit to whitelist <OBJECT>.                                                        //
//                                                                                                       //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params ["_unit"];

private ["_allowedJIP_List"];

_allowedJIP_List = missionNamespace  getVariable ["bmt_arrayMission_allowedJIPPlayerList", nil];

if (isNil "_allowedJIP_List") exitWith {
    player sideChat format ["ERROR (fn_jip_addTo_initialPlayerList.sqf): Variable bmt_arrayMission_allowedJIPPlayerList is not defined."];
};

_allowedJIP_List = _allowedJIP_List + [[getPlayerUID _unit, name _unit]];
missionNamespace setVariable ["bmt_arrayMission_allowedJIPPlayerList", _allowedJIP_List, true];

if (bmt_param_debugOutput == 1) then {
    player sidechat format ["DEBUG (fn_jip_addTo_initialPlayerList.sqf): Player named %1 with UID %2 was successfully added to valid JIP players.", name _unit, getPlayerUID _unit];
};

//============================================= END OF FILE =============================================//
