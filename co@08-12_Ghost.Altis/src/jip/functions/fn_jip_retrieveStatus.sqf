//=======================================================================================================//
// File: fn_jip_retrieveStatus.sqf                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function applies a gear previously stored in the profileNamespace variable          //
//              "bmt_arrayProfile_savedLoadout". This is only true if the current mission name is equal  //
//              to the one stored in "bmt_varProfile_missionName". See also the script:                  //
//              "function/jip/fn_jip_retrieveStatus.sqf".                                                //
//              Arguments:                                                                               //
//               - 0: unit to equip <OBJECT>.                                                            //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params ["_unit"];
private ["_jipInformation", "_uid", "_name", "_found"];

_jipInformation = missionNamespace getVariable ["bmt_arrayMission_jipInformation", nil];

if (isNil "_jipInformation") exitWith {
    player sideChat format ["ERROR (fn_jip_retrieveStatus): Variable bmt_arrayMission_jipInformation is not defined."];
};

_found = false;

{
    if ((_x select 0 == getPlayerUID _unit) AND (_x select 1 == profileName)) exitWith {
        [_unit, _x select 2] call bmt_fnc_jip_retrievePlayerVariables;
        if (_unit getVariable["bmt_var_playerAlive", true]) then {
            _unit setUnitLoadout [_x select 3, false];
        } else {
            _unit setDamage 1;

            sleep 5;
            "normal" cutText ["You were dead when you disconnected. Therefore, you are dead when reconnecting!", "PLAIN"];
        };
        _found =  true;
    };
} forEach _jipInformation;

if (!_found) then {
    player sideChat format ["ERROR (fn_jip_retrieveStatus): Could not find your previous gear!!"];
} else {
    if (bmt_param_debugOutput == 1) then {
        player sidechat format ["DEBUG (fn_jip_saveStatus.sqf): Gear of player %1 with UID %2 retrieved.", profileName, getPlayerUID _unit];
    };
};

//============================================= END OF FILE =============================================//
