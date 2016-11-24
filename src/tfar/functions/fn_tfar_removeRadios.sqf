//=======================================================================================================//
// File: fn_tfar_removeRadios.sqf                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 09/03/2015                                                                             //
// Description: This function removes all radios from the inventory in order to be able, later on, to    //
//              distribute (or not) the adequate radios for the mission. Task Force Arrowhead Radio      //
//              (TFAR) https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki                  //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit whose radios must be configured <OBJECT>.                                     //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Variable declarations.
params [["_unit", objNull]];

// Remove all radios from unit's inventory using TFAR API.
{
    if(_x call TFAR_fnc_isRadio) then {
        _unit unlinkItem _x;
    };
} foreach (items _unit + assignedItems _unit);

//============================================= END OF FILE =============================================//
