//=======================================================================================================//
// File: fn_jip_retrievePlayerVariables.sqf                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function retrieves player related variables that were stored once a player          //
//              disconnected. In this way information regarding medical status, role (medic, engineer),  //
//              number or respawns, ... is preserved if a player drops but can rejoin later due to       //
//              connection problems. The variables are stored in the `fn_jip_savePlayerVariables.sqf`    //
//              fucntion.                                                                                //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit that whill have its player variables restored <OBJECT>       .                //
//               - 1: List containing the values of the player variables <ARRAY>.                        //
//                                                                                                       //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params["_unit", "_jipPlayerVariables"];

{
    _unit setVariable [_x select 0, _x select 1, true];
} forEach _jipPlayerVariables;

// Handle advanced fatigue
if (bmt_mod_ace3) then {
    ace_advanced_fatigue_ae1Reserve = _unit getVariable ["bmt_var_ace_advancedfatigue_ae1Reserve", nil];
    ace_advanced_fatigue_ae2Reserve = _unit getVariable ["bmt_var_ace_advancedfatigue_ae2Reserve", nil];
    ace_advanced_fatigue_anReserve = _unit getVariable ["bmt_var_ace_advancedfatigue_anReserve", nil];
    ace_advanced_fatigue_anFatigue = _unit getVariable ["bmt_var_ace_advancedfatigue_anFatigue", nil];
    ace_advanced_fatigue_muscleDamage = _unit getVariable ["bmt_var_ace_advancedfatigue_muscleDamage", nil];
};

if (bmt_param_debugOutput == 1) then {
    diag_log  format ["DEBUG (fn_jip_retrievePlayerVariables.sqf): Previous status successfully restored %1, %2, %3, %4", _unit getVariable ["bmt_var_ace_advancedfatigue_ae1Reserve", nil], _unit getVariable ["bmt_var_ace_advancedfatigue_ae2Reserve", nil], _unit getVariable ["bmt_var_ace_advancedfatigue_anReserve", nil], _unit getVariable ["bmt_var_ace_advancedfatigue_anFatigue", nil]];
};

player setVariable ["bmt_var_jip_StatusRetrieved", true];

//============================================= END OF FILE =============================================//
