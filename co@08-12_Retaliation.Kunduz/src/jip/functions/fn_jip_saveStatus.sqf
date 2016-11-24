
params ["_unit", "_uid", "_name"];
private ["_jipPlayerVariables", "_loadout", "_jipInformation", "_jipACE3Info", "_jipInformation_List", "_found"];

_jipPlayerVariables = [_unit] call bmt_fnc_jip_savePlayerVariables;
_loadout = getUnitLoadout _unit;
_jipInformation =  [_uid, _name, _jipPlayerVariables, _loadout];

_jipInformation_List = missionNamespace getVariable ["bmt_arrayMission_jipInformation", nil];

if (isNil "_jipInformation_List") then {
    _jipInformation_List = [];
    _jipInformation_List = [_jipInformation];
} else {

    // Check first if an entry for the player already exists.
    _found = false;
    {
        if ((_x select 0 == _uid) AND (_x select 1 == _name)) exitWith {
            _found = true;
            _jipInformation_List set [_forEachIndex, _jipInformation];
            if (bmt_param_debugOutput == 1) then {
                player sidechat format ["DEBUG (fn_jip_saveStatus.sqf): Gear of player %1 with UID %2 already exists. Overwriting it.", _name, _uid];
            };
        };
    } forEach _jipInformation_List;

    if (!_found) then {
        _jipInformation_List pushBack _jipInformation;
    };
};

missionNamespace setVariable ["bmt_arrayMission_jipInformation", _jipInformation_List, true];

if (bmt_param_debugOutput == 1) then {
    player sidechat format ["DEBUG (fn_jip_saveStatus.sqf): Gear of player %1 with UID %2 saved.", _name, _uid];
    player sidechat format ["DEBUG (fn_jip_saveStatus.sqf): Variable with UID %1 and profile name %2.", (_jipInformation_List select 0) select 0, (_jipInformation_List select 0) select 1];
    player sideChat format ["DEBUG (fn_jip_saveStatus.sqf): Number of entries %1", count _jipInformation_List];
};

false
