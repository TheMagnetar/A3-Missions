//=======================================================================================================//
// File: fn_misc_checkEmptyPosition.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This function checks if a vehicle has an empty position.                                 //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: vehicle to be checked <OBJECT>.                                                    //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_vehicle"];
private ["_isFree"];

_isFree = false;

{
    if ((_vehicle emptyPositions _x) != 0) exitWith {
        _isFree = true;
    };
} forEach ["Commander", "Cargo", "Driver", "Gunner"];

_isFree

//============================================= END OF FILE =============================================//
