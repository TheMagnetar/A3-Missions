//=======================================================================================================//
// File: bmt_ace3_assignRandomDamage.sqf                                                                 //
// Author: [UST] Artur                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/07/19                                                                             //
// Description: This script is creates random wounds to an array of units using the ACE3 framework.      //
//              Arguments:                                                                               //
//               - 0: array of objects <ARRAY>.                                                          //
//               - 1: amount of damage: low, medium or high <STRING>.                                    //
//               - 2: type of damage: bullet, vehiclecrash or explosive <STRING>.                        //
//               - 3: when true, the unit will be set to unconscious <BOOL>.                             //
//              Examples:                                                                                //
//               - Single unit:                                                                          //
//                   null = [[b1],"medium","bullet",true]execVM "bmt_ace3_assignRandomDamage.sqf";       //
//               - Multiple units:                                                                       //
//                   null = [[b1,b2,c5],"low","explosion",false]execVM "bmt_ace3_assignRandomDamage.sqf";//
// Changes: 1.0 (2015/07/19) First public version.                                                       //
//=======================================================================================================//

params["_unitsArray", ["_amountDamage", "medium"], ["_typeDamage", "bullet"], ["_isUnconscious", false]];

if (!isServer) exitWith {};

if !( (toLower _amountdamage) in ["low", "medium", "high"]) exitwith {
    player sideChat format ["DEBUG (bmt_ace3_assignRandomDamage.sqf): Unrecognised amount of damage %1. Valid options are low, medium or high.", _amountDamage];
};

if !( (toLower _typeDamage) in ["bullet", "vehiclecrash", "explosion"]) exitwith {
    player sideChat format ["DEBUG (bmt_ace3_assignRandomDamage.sqf): Unrecognised type of damage %1. Valid options are bullet, vehiclecrash or explosive.", _typeDamage];
};

private ["_countArray","_unitWound","_arrayProjectile","_randomParts","_countFor"];
private ["_arrayDamage","_randomDamage","_partsDamage","_typeAnimWound"];

_countArray = count _unitsarray;
_partsDamage = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

switch (toLower _amountdamage) do {
    case "low":    { _arrayDamage = [0.1,0.2,0.3]; };
    case "medium": { _arrayDamage = [0.4,0.5,0.6]; };
    case "high":   { _arrayDamage = [0.6,0.7,0.8]; };
};

while {_countArray > 0} do {
    _countFor = ceil (random count _partsDamage);
    _unitWound =  _unitsarray select (_countArray - 1);

    while {_countFor > 0} do {

        _randomParts = selectRandom _partsDamage;
        _amountdamage = selectRandom _arrayDamage;

        [_unitWound, _amountDamage, _randomParts, _typeDamage] call ace_medical_fnc_addDamageToUnit;
        sleep 1;
        _countFor = _countFor -1;
    };

    if (_isUnconscious) then {
        [_unitWound, true, 1800, true] call ace_medical_fnc_setUnconscious; }
    else {
        _typeAnimWound = selectRandom ["Acts_LyingWounded_loop1","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3"];
        _unitWound switchMove _typeAnimWound;
    };
    _countArray = _countArray - 1;
};

//============================================= END OF FILE =============================================//
