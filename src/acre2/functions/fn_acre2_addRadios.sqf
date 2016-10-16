//=======================================================================================================//
// File: fn_acre2_addRadios.sqf                                                                          //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/28                                                                             //
// Description: This function adds the defined radios to a unit's inventory in case the default radios   //
//              that are assigned are not suficient. Advanced Combat Radio Environment 2 (ACRE2)         //
//              http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home                        //
//              Arguments:                                                                               //
//               - 0: unit whose radios must be configured <OBJECT>.                                     //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Variable declarations.
params [["_unit", objNull]];
private["_unit", "_unitOptions", "_unitRole"];

_unitOptions = _unit getVariable ["bmt_var_configEquipment", "nil"];

if ((typeName _unitOptions) == "STRING") then {
    _unitRole = _unitOptions;
} else {
    _unitRole = _unitOptions select 0; // First entry must always be the unit role
};

// Assign radios depending on the unit role (fn_configEquipment).
if (!isNil "_unitRole") then {

    // Check if it is necessary to assign the radio defined in "bmt_acre2_riflemanRadio" to all units.
    if (bmt_acre2_riflemanRadioEverybody) then {
            if( _unit canAdd bmt_acre2_riflemanRadio ) then {
            _unit addItem bmt_acre2_riflemanRadio;
        } else {
            _unit sideChat format ["ERROR (fn_acre2_addRadios.sqf): Cannot add radio %1.", bmt_acre2_riflemanRadio];
        };
    } else {
        if (_unitRole in bmt_array_riflemanRadio) then {
            if( _unit canAdd bmt_acre2_riflemanRadio ) then {
                _unit addItem bmt_acre2_riflemanRadio;
            } else {
                _unit sideChat format ["ERROR (fn_acre2_addRadios.sqf): Cannot add radio %1.", bmt_acre2_riflemanRadio];
            };
        };
    };

    // Add short range radios.
    if (_unitRole in bmt_array_shortRangeRadio) then {
        if( _unit canAdd bmt_acre2_shortRangeRadio ) then {
            _unit addItem bmt_acre2_shortRangeRadio;
        } else {
            _unit sideChat format ["ERROR (fn_acre2_addRadios.sqf): Cannot add radio %1.", bmt_acre2_shortRangeRadio];
        };
    };

    // Add long range radios.
    if (_unitRole in bmt_array_longRangeRadio) then {
        if( _unit canAdd bmt_acre2_longRangeRadio ) then {
            _unit addItemToBackPack bmt_acre2_longRangeRadio;
        } else {
            _unit sideChat format ["ERROR (fn_acre2_addRadios.sqf): Cannot add radio %1.", bmt_acre2_longRangeRadio];
        };
    };
} else {
    _unit sideChat format ["ERROR (fn_acre2_addRadios.sqf): Undefined unit role."];
};

//============================================= END OF FILE =============================================//
