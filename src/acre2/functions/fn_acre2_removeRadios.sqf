//=======================================================================================================//
// File: fn_acre2_removeRadios.sqf                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/28                                                                             //
// Description: This function removes all radios from the inventory in order to be able, later on, to    //
//              distribute (or not) the adequate radios for the mission. Advanced Combat Radio           //
//              Environment 2 (ACRE2) http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home  //
//              Arguments:                                                                               //
//               - 0: unit whose radios must be configured <OBJECT>.                                     //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Variable declarations.
params [["_unit", objNull]];

// Remove all radios from unit's inventory using ACRE 2 API.
{
    _unit removeItem _x;
} forEach ([] call acre_api_fnc_getCurrentRadioList);

//============================================= END OF FILE =============================================//
