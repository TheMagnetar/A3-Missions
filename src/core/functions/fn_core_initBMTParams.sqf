//=======================================================================================================//
// File: fn_core_initBMTParams.sqf                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/03/08                                                                             //
// Description: This function initalises all bmt_param* variables.                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
// ToDo: Replace entries with getMissionConfigValue.                                                     //
//=======================================================================================================//

if (!isServer) exitWith { };
private ["_paramNames"];

_paramNames = [];

_paramNames = _paramNames + ["bmt_param_ace3_ballistics", "bmt_param_ace3_medicalSystem", "bmt_param_ace3_reviveSystem", "bmt_param_ace3_spectator"]; // ACE 3
_paramNames = _paramNames + ["bmt_param_acre2_configureChannels", "bmt_param_acre2_distributeRadios"];                                                // ACRE 2
_paramNames = _paramNames + ["bmt_param_asrai3_enabled", "bmt_param_asrai3_debug"];                                                                   // ASR AI 3
_paramNames = _paramNames + ["bmt_param_dac_enabled", "bmt_param_dac_debug"];                                                                         // DAC
_paramNames = _paramNames + ["bmt_param_jip_enabled"];                                                                                                // Join-in-Progress (JIP)
_paramNames = _paramNames + ["bmt_param_debugOutput"];                                                                                                // Debug
_paramNames = _paramNames + ["bmt_param_respawn_numRespawns", "bmt_param_respawn_saveGear", "bmt_param_respawn_tickets"];                             // Respawn (A3-BMT Template)
_paramNames = _paramNames + ["bmt_param_t8units_enabled", "bmt_param_t8units_dac", "bmt_param_t8units_debug"];                                        // T8-UNITS
_paramNames = _paramNames + ["bmt_param_tfar_distributeRadios", "bmt_param_tfar_configureChannels", "bmt_param_tfar_configureStereo"];                // TFAR
_paramNames = _paramNames + ["bmt_param_useVAProfiles"];                                                                                              // VA Profiles
_paramNames = _paramNames + ["bmt_param_zeus_admin"];                                                                                                 // Zeus

// Initialise all parameters to zero
{
    call compile format["%1 = %2", _paramNames select _forEachIndex, 0];
    publicVariable _x;
} forEach _paramNames;

//============================================= END OF FILE =============================================//
