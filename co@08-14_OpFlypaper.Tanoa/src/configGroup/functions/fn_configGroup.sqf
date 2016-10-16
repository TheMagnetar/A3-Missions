//=======================================================================================================//
// File: fn_configGroup.sqf                                                                              //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/03                                                                             //
// Description: This function configures to which squad and fire team the unit belongs to. It has an     //
//              effect on radio frequencies, default radio chanels and chat names.                       //
//              Arguments:                                                                               //
//               - 0: group name (Squad callsign) <STRING>.                                              //
//               - 1: subgroup index (Fire team callsign) <FLOAT>.                                       //
//               - 2: unit <OBJECT>.                                                                     //
//              Example:                                                                                 //
//               - Unit belongs to the fire team Alpha-2.                                                //
//                   ["Alpha", 2, this] call bmt_fnc_configGroup;                                        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params [["_groupName", nil], ["_subgroupIndex", -1], "_unit"];
private["_group"];

// Save unit's group in order to being able to reference it later.
_unit setVariable ["bmt_var_unitGroup", [_groupName, _subgroupIndex], true];

// Configure chat if the group is defined.
if (!isNil "_groupName") then {
    _group = group _unit;
    if (_subgroupIndex != -1) then {
        _group setGroupId [format["%1 %2", _groupName, _subgroupIndex], "GroupColor0"];
    } else {
      _group setGroupId [format["%1", _groupName], "GroupColor0"];
    };
};

//============================================= END OF FILE =============================================//
