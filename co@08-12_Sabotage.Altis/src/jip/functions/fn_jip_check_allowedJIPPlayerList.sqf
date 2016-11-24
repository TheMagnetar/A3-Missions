//=======================================================================================================//
// File: fn_jip_check_allowedJIPPlayerList.sqf                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function checks if a JIP player belongs to the allowed JIP players list. It does so //
//              by comparing the stored player UID and profile name with the ones of the given playable  //
//              unit.                                                                                    //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit to check <OBJECT>.                                                            //
//                                                                                                       //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params ["_unit"];
private ["_allowedJIP_List", "_uid", "_name", "_found"];

_allowedJIP_List = missionNamespace getVariable ["bmt_arrayMission_allowedJIPPlayerList", nil];

if (isNil "_allowedJIP_List") exitWith {
    player sideChat format ["ERROR (fn_jip_addTo_initialPlayerList.sqf): Variable bmt_arrayMission_allowedJIPPlayerList is not defined."];
};

_found = false;
{
    if ((_x select 0 == getPlayerUID _unit) AND (_x select 1 == name _unit)) then {
        _found =  true;
    };
} forEach _allowedJIP_List;

if (bmt_param_debugOutput == 1) then {
    player sidechat format ["DEBUG (fn_jip_check_initialPlayerList.sqf): Player named %1 with UID %2 is in the allowed JIP list: %3.", name _unit, getPlayerUID _unit, _found];
};

_found

//============================================= END OF FILE =============================================//
