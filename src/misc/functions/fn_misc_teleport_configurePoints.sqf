//=======================================================================================================//
// File: fn_misc_teleport_configurePoints.sqf                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/18                                                                             //
// Description: This function configures the different teleport points available in a mission. The       //
//              variables bmt_var_teleportPoints_Start and bmt_var_teleportPoints_Destination are        //
//              defined in the file "misionConfig/core/fn_core_commonVariables.sqf".                     //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_description", "_position", "_exp"];

{
    _position = _forEachIndex;
    {
        _description = format ["<t color='#ff1111'>%1</t>", markerText ((bmt_var_teleportPoints_Destination select _position) select _forEachIndex)];
        _exp = format["{[_this select 1, ""%1""] call bmt_fnc_misc_teleport;}", (bmt_var_teleportPoints_Destination select _position) select _forEachIndex];
        (bmt_var_teleportPoints_Start select _position) addaction [_description, call compile _exp, [], 5, false, true];
    } forEach (bmt_var_teleportPoints_Destination select _forEachIndex);
} forEach bmt_var_teleportPoints_Start;

//============================================= END OF FILE =============================================//
