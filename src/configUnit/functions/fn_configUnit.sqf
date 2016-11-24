//=======================================================================================================//
// File: fn_configUnit.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/03                                                                             //
// Description: This function configures playable units by defining to which squad and fire team the     //
//              unit belongs to and by assigning equipment depending on the role.                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: group name (Squad callsign) <STRING>.                                              //
//               - 1: subgroup index (Fire team callsign) <FLOAT>.                                       //
//               - 2: unit role <STRING> or unit role with additional options <ARRAY>.                   //
//               - 3: unit <OBJECT>.                                                                     //
//               - 4: unit faction <STRING><OPTIONAL>.                                                   //
//                                                                                                       //
//              Examples:                                                                                //
//               - Unit is a Fire Team Leader in Alpha-2.                                                //
//                   ["Alpha", 2, "tl", this] call bmt_fnc_configUnit;                                   //
//               - Unit is a Squad Leader in Alpha 1-1 with optional equipment foo.                      //
//                   ["Alpha 1", 1, ["sl", "foo"], this] call bmt_fnc_configUnit;                        //
//               - Unit is a medic in fire team Bravo-1 and has the equipment of the RHS faction         //
//                 "United States Marine Corps" (D) despite not belonging to it.                         //
//                   ["Bravo", 1, "me", this, "rhs_faction_usmc_d"] call bmt_fnc_configUnit;             //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params [["_groupName", nil], ["_subgroupIndex", -1], ["_unitRole", nil], "_unit", ["_unitFaction", nil]];

if (isNil "_unitRole") exitwith {
    _unit sideChat format ["ERROR (fn_configUnit.sqf): unit role is not defined. Aborting."];
};

// Configure squad and fire team.
[_groupName, _subgroupIndex, _unit] call bmt_fnc_configGroup;

// Configure equipment.
[_unitRole, _unit, _unitFaction] call bmt_fnc_configEquipment;

//============================================= END OF FILE =============================================//
