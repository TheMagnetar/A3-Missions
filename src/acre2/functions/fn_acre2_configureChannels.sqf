//=======================================================================================================//
// File: fn_acre2_configureChannels.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/07/26                                                                             //
// Description: This function configures the channels on the different radios of the Advanced Combat     //
//              Radio Environment 2 (ACRE2)                                                              //
//              http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit whose radios must be configured <OBJECT>.                                     //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Variable declarations.
params [["_unit", objNull]];
private ["_unitGroup", "_unitOptions", "_unitRole", "_channel", "_squadChannel", "_fireteamChannel", "_commandChannel"];
private ["_radioList"];

sleep 3;

_unitGroup = _unit getVariable ["bmt_var_unitGroup", ["nil", -1]];
_unitOptions = _unit getVariable ["bmt_var_configEquipment", "NIL"];

if ((typeName _unitOptions) == "STRING") then {
    _unitRole = _unitOptions;
} else {
    _unitRole = _unitOptions select 0; // First entry must always be the unit role
};

if ((_unitGroup select 0 == "nil") or (_unitGroup select 1 == -1)) exitWith {
    _unit sideChat format ["ERROR (fn_acre2_configureChannels.sqf): Channels cannot be configured since variable ""bmt_var_unitGroup"" is not correctly defined: [%1,%2].", _unitGroup select 0, _unitGroup select 1];
};

_channel = 1;
// Get squad channel
{
    if (_unitGroup select 0 in _x) then {
        _squadChannel = _channel;
        if (_unitGroup select 1 >= count _x) exitWith {
            _unit sideChat format ["ERROR (fn_acre2_configureChannels.sqf): Fire team %1-%2 is not defined.", _unitGroup select 0, _unitGroup select 1];
        };
        _fireteamChannel = _squadChannel + (_unitGroup select 1);
    };

    if ("Command" in _x) then {
        _commandChannel = _channel;
    };
    _channel = _channel + (count _x);
} forEach bmt_array_groups;

// Get unit's radios.
_radioList = call acre_api_fnc_getCurrentRadioList;
{

    // PRC343 radios active channel defaults to the one associated to the fireteam.
    if ([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf) then {
        [_x, _fireteamChannel] call acre_api_fnc_setRadioChannel;
    };

    // PRC148 radios active channel defaults to the squad net.
    if ([_x, "ACRE_PRC148"] call acre_api_fnc_isKindOf) then {
        [_x, _squadChannel] call acre_api_fnc_setRadioChannel;
    };

    // PRC152 radios active channel defaults to the squad net.
    if ([_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf) then {
        [_x, _squadChannel] call acre_api_fnc_setRadioChannel;
    };

    // PRC117F radios active channel defaults to command channel.
    if ([_x, "ACRE_PRC117F"] call acre_api_fnc_isKindOf) then {
        [_x, _commandChannel] call acre_api_fnc_setRadioChannel;
    };
} forEach(_radioList);

//============================================= END OF FILE =============================================//
